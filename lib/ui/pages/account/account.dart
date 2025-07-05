import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/ui/components/totals_tile.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;
    final accountName = accountsState.selectedAccount.name;

    return Scaffold(
      appBar: AppBar(
        title: Text(accountName),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () async {
              final controller = TextEditingController(text: accountName);
              final newName = await showDialog<String>(
                context: context,
                builder: (final context) => AlertDialog(
                  title: Text('account.edit_account_name'.tr()),
                  content: TextField(
                    controller: controller,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'account.account_name'.tr(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('common.cancel'.tr()),
                    ),
                    TextButton(
                      onPressed: () {
                        final name = controller.text.trim();
                        if (name.isNotEmpty && name != accountName) {
                          Navigator.of(context).pop(name);
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      child: Text('common.save'.tr()),
                    ),
                  ],
                ),
              );
              if (context.mounted) {
                if (newName != null && newName != accountName) {
                  context.read<AccountsBloc>().add(
                    RenameAccount(newName: newName),
                  );
                }
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: const _AccountContent(),
    );
  }
}

class _AccountContent extends StatelessWidget {
  const _AccountContent();

  @override
  Widget build(final BuildContext context) {
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TotalsTile(
          title: 'common.balance'.tr(),
          trailing:
              '${accountsState.selectedAccount.balance.toStringAsFixed(2)} ${accountsState.currencySymbol}',
          showTrailingArrow: true,
          shouldApplySpoiler: true,
        ),
        const Divider(height: 0),
        TotalsTile(
          title: 'common.currency'.tr(),
          trailing: accountsState.currencySymbol,
          showTrailingArrow: true,
          onTap: () async {
            final String newCurrency =
                await showModalBottomSheet<String>(
                  showDragHandle: true,
                  context: context,
                  builder: (final context) => ListView.builder(
                    itemCount: Currency.values.length + 1,
                    itemBuilder: (final context, final index) {
                      if (index == Currency.values.length) {
                        return ListTile(
                          title: Text('common.cancel'.tr()),
                          leading: Icon(
                            Icons.cancel_outlined,
                            color: Theme.of(
                              context,
                            ).colorScheme.onErrorContainer,
                          ),
                          onTap: () => Navigator.of(context).pop(''),
                          tileColor: Theme.of(
                            context,
                          ).colorScheme.errorContainer,
                          textColor: Theme.of(
                            context,
                          ).colorScheme.onErrorContainer,
                        );
                      }

                      final currency = Currency.values[index];
                      return ListTile(
                        title: Text(currency.fullName.tr()),
                        leading: Icon(currency.icon),
                        onTap: () => Navigator.of(context).pop(currency.name),
                      );
                    },
                  ),
                ) ??
                '';
            if (context.mounted && newCurrency.isNotEmpty) {
              context.read<AccountsBloc>().add(
                ChangeCurrency(newCurrency: newCurrency),
              );
            }
          },
        ),
        const Divider(height: 0),
        const Expanded(child: _TransactionsDeltaChart()),
      ],
    );
  }
}

class _TransactionsDeltaChart extends StatelessWidget {
  const _TransactionsDeltaChart();

  @override
  Widget build(final BuildContext context) {
    final currencySymbol =
        (context.watch<AccountsBloc>().state as SelectedAccountsState)
            .currencySymbol;

    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (final context, final state) {
        if (state.status == TransactionsStatus.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.status == TransactionsStatus.error) {
          return Center(
            child: Text(
              'Error: ${state.errorMessage}',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          );
        }

        if (state.transactionsDelta.isEmpty) {
          return const Center(child: Text('No transaction data available'));
        }

        return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 400,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: _getMaxValue(state.transactionsDelta),
                    minY: 0,
                    gridData: const FlGridData(show: false),
                    barTouchData: BarTouchData(
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipItem:
                            (
                              final group,
                              final groupIndex,
                              final rod,
                              final rodIndex,
                            ) {
                              final delta = state.transactionsDelta[groupIndex];
                              final dateStr = DateFormat(
                                'MMM dd',
                              ).format(delta.date);
                              return BarTooltipItem(
                                '$dateStr\n${delta.delta.toStringAsFixed(2)} $currencySymbol',
                                TextStyle(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onInverseSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (final value, final meta) {
                            final index = value.toInt();
                            if (index >= 0 &&
                                index < state.transactionsDelta.length) {
                              final delta = state.transactionsDelta[index];
                              if (index % 5 == 0 ||
                                  index == state.transactionsDelta.length - 1) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    DateFormat('dd.MM').format(delta.date),
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                );
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ),
                      leftTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    barGroups: state.transactionsDelta.asMap().entries.map((
                      final entry,
                    ) {
                      final index = entry.key;
                      final delta = entry.value;

                      Color barColor;
                      if (delta.delta > Decimal.zero) {
                        barColor = const Color(0xFF2AE881);
                      } else if (delta.delta < Decimal.zero) {
                        barColor = const Color(0xFFFF5F00);
                      } else {
                        barColor = Colors.grey;
                      }

                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: delta.delta.abs().toDouble(),
                            color: barColor,
                            width: 8,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  double _getMaxValue(final List<DayTransactionsDelta> deltas) {
    if (deltas.isEmpty) {
      return 0;
    }
    final maxDelta = deltas
        .map((final d) => d.delta.abs())
        .reduce((final a, final b) => a > b ? a : b);
    return maxDelta.toDouble() * 1.2; // Add 20% padding
  }

  String getCategoryName(final String? categoryId) {
    if (categoryId == null || categoryId.isEmpty) {
      return 'common.uncategorized'.tr();
    }
    // Assuming you have a method to get category name by ID
    return 'Category Name'; // Replace with actual logic to get category name
  }
}
