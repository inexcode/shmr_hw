import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/models/enums.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';
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
                  context
                      .read<AccountsBloc>()
                      .add(RenameAccount(newName: newName));
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
  const _AccountContent({super.key});

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
        ),
        const Divider(height: 0),
        TotalsTile(
          title: 'common.currency'.tr(),
          trailing: accountsState.currencySymbol,
          showTrailingArrow: true,
          onTap: () async {
            final String newCurrency = await showModalBottomSheet<String>(
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
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                          onTap: () => Navigator.of(context).pop(''),
                          tileColor:
                              Theme.of(context).colorScheme.errorContainer,
                          textColor:
                              Theme.of(context).colorScheme.onErrorContainer,
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
              context
                  .read<AccountsBloc>()
                  .add(ChangeCurrency(newCurrency: newCurrency));
            }
          },
        ),
      ],
    );
  }
}
