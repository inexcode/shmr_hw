import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';

class CategoryEmoji extends StatelessWidget {
  const CategoryEmoji({required this.categoryId, super.key});

  final int categoryId;

  @override
  Widget build(final BuildContext context) {
    final categoriesState = context.watch<CategoriesBloc>().state;

    if (categoriesState is LoadedCategoriesState) {
      return Text(categoriesState.categories[categoryId]?.emoji ?? '❓');
    }
    if (categoriesState is LoadingWithCacheCategoriesState) {
      return Text(categoriesState.categories[categoryId]?.emoji ?? '❓');
    }
    if (categoriesState is InitialCategoriesState ||
        categoriesState is LoadingCategoriesState) {
      return const CircularProgressIndicator();
    }
    return const Text('⚠️');
  }
}
