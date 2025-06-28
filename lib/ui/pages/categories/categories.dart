import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/ui/components/category_emoji.dart';
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
  const _CategoriesContent();

  @override
  State<_CategoriesContent> createState() => _CategoriesContentState();
}

class _CategoriesContentState extends State<_CategoriesContent> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() {
      setState(() {
        _searchQuery = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<MapEntry<int, Category>> _filterCategories(
    final Map<int, Category> categories,
  ) {
    final categoriesList = categories.entries.toList();

    if (_searchQuery.isEmpty) {
      return categoriesList;
    }

    final categoryNames =
        categoriesList.map((final entry) => entry.value.name).toList();

    final results = extractAllSorted(
      query: _searchQuery,
      choices: categoryNames,
      cutoff: 60,
    );

    return results.map((final result) {
      final categoryIndex = result.index;
      return categoriesList[categoryIndex];
    }).toList();
  }

  @override
  Widget build(final BuildContext context) {
    final categoriesState =
        context.watch<CategoriesBloc>().state as LoadedCategoriesState;

    final filteredCategories = _filterCategories(categoriesState.categories);

    return Column(
      children: [
        Container(
          color: Theme.of(context).colorScheme.surfaceContainerHigh,
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Center(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'categories.search_hint'.tr(),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: _searchController.clear,
                      )
                    : const Icon(Icons.search),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                filled: false,
              ),
            ),
          ),
        ),
        Expanded(
          child: filteredCategories.isEmpty && _searchQuery.isNotEmpty
              ? PagePlaceholder(
                  title: 'categories.no_results'.tr(),
                  iconData: Icons.search_off,
                )
              : ListView.separated(
                  separatorBuilder:
                      (final BuildContext context, final int index) =>
                          const Divider(
                    height: 0,
                  ),
                  itemCount: filteredCategories.length,
                  itemBuilder: (
                    final BuildContext context,
                    final int index,
                  ) {
                    final categoryEntry = filteredCategories[index];
                    final category = categoryEntry.value;
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
