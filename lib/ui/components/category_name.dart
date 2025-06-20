import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';

class CategoryName extends StatelessWidget {
  const CategoryName({
    required this.categoryId,
    super.key,
  });

  final int categoryId;
  @override
  Widget build(final BuildContext context) {
    final categoriesState = context.watch<CategoriesBloc>().state;

    if (categoriesState is LoadedCategoriesState) {
      return Text(
        categoriesState.categories[categoryId]?.name ??
            'categories.unknown_category'.tr(),
      );
    }
    if (categoriesState is InitialCategoriesState ||
        categoriesState is LoadingCategoriesState) {
      return Text('common.loading'.tr());
    }
    return Text('common.error'.tr());
  }
}
