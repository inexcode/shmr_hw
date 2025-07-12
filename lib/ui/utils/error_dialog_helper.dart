import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showSyncErrorDialog({
  required final BuildContext context,
  required final String errorMessage,
  required final Function() onRetryCallback,
  required final Function() onCloseCallback,
}) => showDialog<void>(
  context: context,
  barrierDismissible: false,
  builder: (final BuildContext dialogContext) => AlertDialog(
    icon: const Icon(Icons.error),
    title: Text('common.sync_error'.tr()),
    content: Text(errorMessage, style: Theme.of(context).textTheme.bodyMedium),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(dialogContext).pop();
          onCloseCallback();
        },
        child: Text('common.continue_offline'.tr()),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(dialogContext).pop();
          onRetryCallback();
        },
        child: Text('common.retry_sync'.tr()),
      ),
    ],
  ),
);
