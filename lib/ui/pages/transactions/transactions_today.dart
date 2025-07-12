import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';
import 'package:shmr_hw/ui/components/totals_tile.dart';
import 'package:shmr_hw/ui/components/transaction_dialog.dart';
import 'package:shmr_hw/ui/components/transaction_tile.dart';
import 'package:shmr_hw/ui/components/transactions_loading_status.dart';
import 'package:shmr_hw/ui/router/router.dart';

@RoutePage()
class TransactionsTodayPage extends StatelessWidget {
  const TransactionsTodayPage({this.isIncome = false, super.key});

  final bool isIncome;

  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;

    late final Widget childWidget;

    switch (transactionsState.status) {
      case TransactionsStatus.initial:
        childWidget = const Center(child: CircularProgressIndicator());
      case TransactionsStatus.loading:
        if (transactionsState.transactionsToday.isEmpty) {
          childWidget = const Center(child: CircularProgressIndicator());
        } else {
          childWidget = _TransactionsTodayContent(isIncome: isIncome);
        }
      case TransactionsStatus.loaded:
        childWidget = _TransactionsTodayContent(isIncome: isIncome);
      case TransactionsStatus.error:
        childWidget = Center(
          child: PagePlaceholder(
            title:
                transactionsState.errorMessage?.tr() ??
                'expenses.error_message'.tr(),
            iconData: Icons.error_outline,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          isIncome
              ? 'income.income_today'.tr()
              : 'expenses.expenses_today'.tr(),
        ).tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              unawaited(
                context.pushRoute(TransactionsHistoryRoute(isIncome: isIncome)),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          unawaited(
            transactionDialogBuilder(context: context, isIncome: isIncome),
          );
        },
      ),
      body: childWidget,
    );
  }
}

class _TransactionsTodayContent extends StatelessWidget {
  const _TransactionsTodayContent({required this.isIncome});

  final bool isIncome;
  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;

    final transactions = isIncome
        ? transactionsState.incomesToday
        : transactionsState.expensesToday;

    final total = isIncome
        ? transactionsState.totalIncomesToday
        : transactionsState.totalExpensesToday;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TotalsTile(
          title: '${isIncome ? 'income' : 'expenses'}.total'.tr(),
          trailing: '$total ${accountsState.currencySymbol}',
          shouldApplySpoiler: true,
        ),
        const Divider(height: 0),
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: transactions.length,
            itemBuilder: (final context, final index) {
              final transaction = transactions[index];
              return TransactionTile(
                transaction: transaction,
                key: ValueKey('daily-${transaction.id}'),
                onTap: () {
                  unawaited(
                    transactionDialogBuilder(
                      context: context,
                      isIncome: isIncome,
                      transaction: transaction,
                    ),
                  );
                },
              );
            },
            separatorBuilder: (final BuildContext context, final int index) =>
                const Divider(height: 0),
          ),
        ),
        const Divider(height: 0),
        const TransactionsLoadingStatus(),
      ],
    );
  }
}
