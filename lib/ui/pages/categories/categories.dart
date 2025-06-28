import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/ui/components/category_emoji.dart';
import 'package:shmr_hw/ui/components/custom_icons.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';

@RoutePage()
class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(final BuildContext context) {
    final categoriesState = context.watch<CategoriesBloc>().state;

    late final Widget childWidget;

    switch (categoriesState) {
      case InitialCategoriesState():
      case LoadingCategoriesState():
        childWidget = const Center(child: CircularProgressIndicator());
      case LoadedCategoriesState():
        childWidget = const _CategoriesContent();
      case ErrorCategoriesState():
        childWidget = Center(
          child: PagePlaceholder(
            title: categoriesState.errorMessage.tr(),
            iconData: Icons.error_outline,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('categories.my_categories'.tr()).tr(),
      ),
      body: childWidget,
    );
  }
}

class _CategoriesContent extends StatefulWidget {
  const _CategoriesContent({super.key});

  @override
  State<_CategoriesContent> createState() => _CategoriesContentState();
}

class _CategoriesContentState extends State<_CategoriesContent> {
  @override
  Widget build(final BuildContext context) {
    final categoriesState =
    context.watch<CategoriesBloc>().state as LoadedCategoriesState;

    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          height: 56,
          child: Placeholder(),
        ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (final BuildContext context, final int index) =>
            const Divider(
              height: 0,
            ),
            itemCount: categoriesState.categories.length,
            itemBuilder: (
                final BuildContext context,
                final int index,
                ) {
              final category = categoriesState.categories[index];
              if (category == null) {
                return const SizedBox.shrink();
              }
              return ListTile(
                leading: CircleAvatar(
                  child: CategoryEmoji(categoryId: category.id),
                ),
                title: Text(category.name),
              );
            },
          ),
        ),
      ],
    );
  }
}
