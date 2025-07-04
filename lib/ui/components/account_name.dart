import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';

class AccountName extends StatelessWidget {
  const AccountName({required this.accountId, this.style, super.key});

  final int accountId;
  final TextStyle? style;

  @override
  Widget build(final BuildContext context) {
    final accountsState = context.watch<AccountsBloc>().state;

    if (accountsState is SelectedAccountsState) {
      final account = accountsState.accountById(accountId);
      if (account != null) {
        return Text(
          account.name,
          style: style ?? Theme.of(context).textTheme.bodyLarge,
        );
      } else {
        return Text('accounts.unknown_account'.tr(), style: style);
      }
    }

    return Text('common.loading'.tr(), style: style);
  }
}
