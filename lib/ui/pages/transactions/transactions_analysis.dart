import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';
import 'package:shmr_hw/ui/components/totals_tile.dart';
import 'package:shmr_hw/ui/components/transaction_tile.dart';

@RoutePage()
class TransactionsAnalysisPage extends StatelessWidget {
  const TransactionsAnalysisPage({
    required this.isIncome,
    super.key,
  });

  final bool isIncome;

  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;

    late final Widget childWidget;

    switch (transactionsState.status) {
      case TransactionsStatus.initial:
      case TransactionsStatus.loading:
        childWidget = const Center(child: CircularProgressIndicator());
      case TransactionsStatus.loaded:
        childWidget = Center(
          child: _TransactionsAnalysisContent(isIncome: isIncome),
        );
      case TransactionsStatus.error:
        childWidget = Center(
          child: PagePlaceholder(
            title: transactionsState.errorMessage?.tr() ??
                'expenses.error_message'.tr(),
            iconData: Icons.error_outline,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'common.analysis'.tr(),
        ).tr(),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: childWidget,
    );
  }
}

class _TransactionsAnalysisContent extends StatelessWidget {
  const _TransactionsAnalysisContent({
    required this.isIncome,
  });

  final bool isIncome;

  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;

    final transactions = isIncome
        ? transactionsState.groupedIncomes
        : transactionsState.groupedExpenses;

    final total = isIncome
        ? transactionsState.totalIncomes
        : transactionsState.totalExpenses;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TotalsTile(
          title: 'expenses.period_start'.tr(),
          trailing:
              DateFormat('yyyy-MM-dd').format(transactionsState.startDate),
          greenBackground: false,
          onTap: () async {
            final DateTimeRange<DateTime>? dateRange =
                await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDateRange: DateTimeRange(
                start: transactionsState.startDate,
                end: transactionsState.endDate,
              ),
            );
            if (dateRange != null) {
              if (context.mounted) {
                context.read<TransactionsBloc>().add(
                      SetStartEndDate(
                        startDate: dateRange.start,
                        endDate: dateRange.end,
                      ),
                    );
              }
            }
          },
        ),
        const Divider(height: 0),
        TotalsTile(
          title: 'expenses.period_end'.tr(),
          trailing: DateFormat('yyyy-MM-dd').format(transactionsState.endDate),
          greenBackground: false,
          onTap: () async {
            final DateTimeRange<DateTime>? dateRange =
                await showDateRangePicker(
              context: context,
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
              initialDateRange: DateTimeRange(
                start: transactionsState.startDate,
                end: transactionsState.endDate,
              ),
            );
            if (dateRange != null) {
              if (context.mounted) {
                context.read<TransactionsBloc>().add(
                      SetStartEndDate(
                        startDate: dateRange.start,
                        endDate: dateRange.end,
                      ),
                    );
              }
            }
          },
        ),
        const Divider(height: 0),
        TotalsTile(
          title: '${isIncome ? 'income' : 'expenses'}.total'.tr(),
          trailing: '$total ${accountsState.currencySymbol}',
          shouldApplySpoiler: true,
          greenBackground: false,
        ),
        const Divider(height: 0),
        Expanded(
          child: ListView.separated(
            itemCount: transactions.length,
            itemBuilder: (final context, final index) {
              final transaction = transactions[index];
              return TransactionTile(
                transaction: transaction,
                key: ValueKey('history-transaction-${transaction.id}'),
                percent:
                    ((transaction.amount / total).toDouble() * 100).round(),
              );
            },
            separatorBuilder: (final BuildContext context, final int index) =>
                const Divider(
              height: 0,
            ),
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
