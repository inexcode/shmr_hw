import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('account.title'.tr()).tr(),
        ),
        body: Center(
          child: PagePlaceholder(
            title: 'account.title'.tr(),
            iconData: CustomIcons.account,
          ),
        ),
      );
}
