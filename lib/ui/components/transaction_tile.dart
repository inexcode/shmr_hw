import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/ui/components/category_emoji.dart';
import 'package:shmr_hw/ui/components/category_name.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    required this.transaction,
    super.key,
  });

  final Transaction transaction;

  @override
  Widget build(final BuildContext context) {
    final accountsState = context.watch<AccountsBloc>().state;

    if (accountsState is! SelectedAccountsState) {
      return const SizedBox.shrink();
    }

    return ListTile(
      leading: (transaction.isIncome ?? false)
          ? null
          : CircleAvatar(
              child: CategoryEmoji(categoryId: transaction.categoryId),
            ),
      title: CategoryName(categoryId: transaction.categoryId),
      subtitle: transaction.comment != null ? Text(transaction.comment!) : null,
      minTileHeight: 70,
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${transaction.amount} ${accountsState.currencySymbol}',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.chevron_right,
            color: Theme.of(context).colorScheme.onSurfaceVariant.withAlpha(76),
          ),
        ],
      ),
    );
  }
}
