import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/accounts/accounts_bloc.dart';
import 'package:shmr_hw/logic/models/transaction.dart';
import 'package:shmr_hw/ui/components/category_emoji.dart';
import 'package:shmr_hw/ui/components/category_name.dart';
import 'package:shmr_hw/ui/components/spoiler_balance.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    required this.transaction,
    this.showDate = false,
    this.percent,
    this.onTap,
    super.key,
  });

  final Transaction transaction;
  final bool showDate;
  final int? percent;
  final GestureTapCallback? onTap;

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
      onTap: onTap,
      trailing: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (percent != null)
                Text(
                  '$percent%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              SpoilerBalance(
                child: Text(
                  '${transaction.amount} ${accountsState.currencySymbol}',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              if (showDate)
                Text(
                  DateFormat('yyyy-MM-dd hh:mm')
                      .format(transaction.transactionDate),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
            ],
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
