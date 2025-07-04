import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:decimal/decimal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/logic/bloc/transaction_form/transaction_form_bloc.dart';
import 'package:shmr_hw/logic/bloc/transactions/transactions_bloc.dart';
import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/ui/components/account_name.dart';
import 'package:shmr_hw/ui/components/category_name.dart';
import 'package:shmr_hw/ui/components/generic_tile.dart';
import 'package:shmr_hw/ui/components/locale_number_input_formatter.dart';
import 'package:shmr_hw/ui/pages/categories/categories.dart';

Future<void> transactionDialogBuilder({
  required final BuildContext context,
  required final bool isIncome,
  final Transaction? transaction,
}) => showDialog(
  context: context,
  builder: (final context) =>
      TransactionDialog(isIncome: isIncome, transaction: transaction),
);

class TransactionDialog extends StatefulWidget {
  const TransactionDialog({
    required this.isIncome,
    super.key,
    this.transaction,
  });

  final bool isIncome;
  final Transaction? transaction;

  @override
  State<TransactionDialog> createState() => _TransactionDialogState();
}

class _TransactionDialogState extends State<TransactionDialog> {
  late final TextEditingController _amountController;
  late final TextEditingController _commentController;

  @override
  void initState() {
    super.initState();
    _amountController = TextEditingController();
    _commentController = TextEditingController();
  }

  @override
  void dispose() {
    _amountController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    final accountsState =
        context.watch<AccountsBloc>().state as SelectedAccountsState;

    return BlocProvider<TransactionFormBloc>(
      create: (final context) => TransactionFormBloc(
        defaultAccountId: accountsState.selectedAccount.id,
        isIncome: widget.isIncome,
        initialTransaction: widget.transaction,
      ),
      child: Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              widget.isIncome
                  ? 'income.my_income'.tr()
                  : 'expenses.my_expenses'.tr(),
            ),
            actions: [
              BlocBuilder<TransactionFormBloc, TransactionFormState>(
                builder: (final context, final state) => IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: state.isFilled
                      ? () {
                          final transaction = state.transaction;
                          if (transaction == null) {
                            return;
                          }
                          context.read<TransactionsBloc>().add(
                            widget.transaction == null
                                ? CreateTransaction(transaction: transaction)
                                : EditTransaction(
                                    id: widget.transaction!.id,
                                    transaction: transaction,
                                  ),
                          );
                          context.pop();
                        }
                      : () async {
                          await showDialog(
                            context: context,
                            builder: (final context) => AlertDialog(
                              title: Text('common.cant_save'.tr()),
                              content: Text('common.fill_all_fields'.tr()),
                              actions: [
                                TextButton(
                                  onPressed: context.pop,
                                  child: Text('common.ok'.tr()),
                                ),
                              ],
                            ),
                          );
                        },
                ),
              ),
            ],
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: context.pop,
            ),
          ),
          body: BlocConsumer<TransactionFormBloc, TransactionFormState>(
            listener: (final context, final state) {
              if (state.amount != null) {
                final formatter = NumberFormat(
                  '#,##0.##',
                  Localizations.localeOf(context).toString(),
                );
                final formattedAmount = formatter
                    .format(state.amount!.toDouble())
                    .replaceAll(',', ' ');
                if (_amountController.text != formattedAmount) {
                  _amountController.text = formattedAmount;
                }
              } else if (_amountController.text.isNotEmpty) {
                _amountController.clear();
              }

              if (state.description != null) {
                if (_commentController.text != state.description!) {
                  _commentController.text = state.description!;
                }
              } else if (_commentController.text.isNotEmpty) {
                _commentController.clear();
              }
            },
            builder: (final context, final state) {
              if (_amountController.text.isEmpty && state.amount != null) {
                final formatter = NumberFormat(
                  '#,##0.##',
                  Localizations.localeOf(context).toString(),
                );
                _amountController.text = formatter
                    .format(state.amount!.toDouble())
                    .replaceAll(',', ' ');
              }
              if (_commentController.text.isEmpty &&
                  state.description != null) {
                _commentController.text = state.description!;
              }

              final trailingTextTheme = Theme.of(context).textTheme.bodyLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface);

              return ListView(
                children: [
                  GenericTile(
                    title: Text('common.account'.tr()),
                    trailing: AccountName(
                      accountId: state.accountId,
                      style: trailingTextTheme,
                    ),
                    showTrailingChevron: true,
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (final context) =>
                            BlocProvider<AccountsBloc>.value(
                              value: context.read<AccountsBloc>(),
                              child: ListView(
                                shrinkWrap: true,
                                children: accountsState.accounts
                                    .map(
                                      (final account) => GenericTile(
                                        title: Text(account.name),
                                        trailing: account.id == state.accountId
                                            ? const Icon(Icons.check)
                                            : null,
                                        onTap: () {
                                          context
                                              .read<TransactionFormBloc>()
                                              .add(
                                                SetAccountIdTransactionFormEvent(
                                                  accountId: account.id,
                                                ),
                                              );
                                          context.pop();
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                      );
                    },
                  ),
                  const Divider(height: 0),
                  GenericTile(
                    title: Text('common.category'.tr()),
                    trailing: state.categoryId != null
                        ? CategoryName(
                            categoryId: state.categoryId!,
                            style: trailingTextTheme,
                          )
                        : Text('common.not_set'.tr(), style: trailingTextTheme),
                    showTrailingChevron: true,
                    onTap: () {
                      showBottomSheet(
                        context: context,
                        showDragHandle: true,
                        builder: (final context) =>
                            BlocProvider<CategoriesBloc>.value(
                              value: context.read<CategoriesBloc>(),
                              child: CategoriesContent(
                                pageType: widget.isIncome
                                    ? CategoriesPageType.income
                                    : CategoriesPageType.expenses,
                                onTapCallback: (final category) {
                                  context.read<TransactionFormBloc>().add(
                                    SetCategoryIdTransactionFormEvent(
                                      categoryId: category.id,
                                    ),
                                  );
                                },
                              ),
                            ),
                      );
                    },
                  ),
                  const Divider(height: 0),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 24, 8),
                    child: TextField(
                      controller: _amountController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        LocaleNumberInputFormatter(
                          Localizations.localeOf(context),
                        ),
                      ],
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '0.00',
                        suffixText: ' ${accountsState.currencySymbol}',
                        suffixStyle: trailingTextTheme,
                        prefixText: 'common.amount'.tr(),
                        prefixStyle: trailingTextTheme,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      textAlign: TextAlign.right,
                      onChanged: (final value) {
                        final cleanValue = value.replaceAll(
                          RegExp(r'[^\d.]'),
                          '',
                        );
                        final amount = Decimal.tryParse(cleanValue);
                        if (amount != null && amount > Decimal.zero) {
                          context.read<TransactionFormBloc>().add(
                            SetAmountTransactionFormEvent(amount: amount),
                          );
                        } else if (cleanValue.isEmpty) {
                          context.read<TransactionFormBloc>().add(
                            const SetAmountTransactionFormEvent(amount: null),
                          );
                        }
                      },
                    ),
                  ),
                  const Divider(height: 0),
                  GenericTile(
                    title: Text('common.date'.tr()),
                    trailing: Text(
                      state.date != null
                          ? DateFormat.yMd().format(state.date!)
                          : 'common.not_set'.tr(),
                      style: trailingTextTheme,
                    ),
                    showTrailingChevron: false,
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: state.date ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      ).then((final selectedDate) {
                        if (selectedDate != null && context.mounted) {
                          context.read<TransactionFormBloc>().add(
                            SetDateTransactionFormEvent(date: selectedDate),
                          );
                        }
                      });
                    },
                  ),
                  const Divider(height: 0),
                  GenericTile(
                    title: Text('common.time'.tr()),
                    trailing: Text(
                      state.time != null
                          ? state.time!.format(context)
                          : 'common.not_set'.tr(),
                      style: trailingTextTheme,
                    ),
                    showTrailingChevron: false,
                    onTap: () async {
                      await showTimePicker(
                        context: context,
                        initialTime: state.time ?? TimeOfDay.now(),
                      ).then((final selectedTime) {
                        if (selectedTime != null) {
                          if (context.mounted) {
                            context.read<TransactionFormBloc>().add(
                              SetTimeTransactionFormEvent(time: selectedTime),
                            );
                          }
                        }
                      });
                    },
                  ),
                  const Divider(height: 0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'common.add_comment_hint'.tr(),
                      ),
                      textAlign: TextAlign.left,
                      onChanged: (final value) {
                        context.read<TransactionFormBloc>().add(
                          SetDescriptionTransactionFormEvent(
                            description: value.isEmpty ? null : value,
                          ),
                        );
                      },
                    ),
                  ),
                  const Divider(height: 0),
                  const SizedBox(height: 32),
                  if (widget.transaction != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                        ),
                        onPressed: () async {
                          final stringContext = widget.isIncome
                              ? 'income'
                              : 'expenses';
                          final response = await showDialog<bool>(
                            context: context,
                            builder: (final context) => AlertDialog(
                              title: Text('$stringContext.delete'.tr()),
                              content: Text(
                                '$stringContext.delete_confirmation'.tr(),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => context.pop(false),
                                  child: Text('common.cancel'.tr()),
                                ),
                                TextButton(
                                  onPressed: () {
                                    context.read<TransactionsBloc>().add(
                                      DeleteTransaction(
                                        id: widget.transaction!.id,
                                      ),
                                    );
                                    context.pop(true);
                                  },
                                  child: Text('common.delete'.tr()),
                                ),
                              ],
                            ),
                          );
                          if (response ?? false) {
                            if (context.mounted) {
                              context.pop();
                            }
                          }
                        },
                        child: Text(
                          '${widget.isIncome ? 'income' : 'expenses'}.delete'
                              .tr(),
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
