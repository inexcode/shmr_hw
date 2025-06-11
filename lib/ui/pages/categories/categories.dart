import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('categories.title'.tr()).tr(),
        ),
        body: Center(
          child: PagePlaceholder(
            title: 'categories.title'.tr(),
            iconData: CustomIcons.categories,
          ),
        ),
      );
}
