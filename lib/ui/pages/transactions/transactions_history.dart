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
class TransactionsHistoryPage extends StatelessWidget {
  const TransactionsHistoryPage({
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
          child: _TransactionsHistoryContent(isIncome: isIncome),
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
          'expenses.my_history'.tr(),
        ).tr(),
        actions: [
          IconButton(
            icon: const Icon(Icons.content_paste_search_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: childWidget,
    );
  }
}

class _TransactionsHistoryContent extends StatelessWidget {
  const _TransactionsHistoryContent({
    required this.isIncome,
  });

  final bool isIncome;
  @override
  Widget build(final BuildContext context) {
    final transactionsState = context.watch<TransactionsBloc>().state;
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;

    final transactions =
        isIncome ? transactionsState.incomes : transactionsState.expenses;

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
          title: 'sorting.sort_by'.tr(),
          trailing: transactionsState.sortOrder.name.tr(),
          onTap: () async {
            final SortOrder? sortOrder = await showModalBottomSheet<SortOrder>(
              context: context,
              builder: (final BuildContext context) => ListView(
                children: SortOrder.values
                    .map(
                      (final sortOrder) => ListTile(
                        title: Text(sortOrder.name.tr()),
                        onTap: () {
                          Navigator.of(context).pop(sortOrder);
                        },
                      ),
                    )
                    .toList(),
              ),
            );
            if (sortOrder != null && context.mounted) {
              context
                  .read<TransactionsBloc>()
                  .add(SetSortOrder(sortOrder: sortOrder));
            }
          },
        ),
        const Divider(height: 0),
        TotalsTile(
          title: '${isIncome ? 'income' : 'expenses'}.total'.tr(),
          trailing: '$total ${accountsState.currencySymbol}',
        ),
        ListView.separated(
          shrinkWrap: true,
          itemCount: transactions.length,
          itemBuilder: (final context, final index) {
            final transaction = transactions[index];
            return TransactionTile(
              transaction: transaction,
              showDate: true,
            );
          },
          separatorBuilder: (final BuildContext context, final int index) =>
              const Divider(
            height: 0,
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }
}
