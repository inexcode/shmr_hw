import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fuzzywuzzy/fuzzywuzzy.dart';
import 'package:shmr_hw/logic/bloc/categories/categories_bloc.dart';
import 'package:shmr_hw/logic/models/category.dart';
import 'package:shmr_hw/ui/components/category_emoji.dart';
import 'package:shmr_hw/ui/components/placeholders/page_placeholder.dart';
import 'package:shmr_hw/ui/components/transactions_loading_status.dart';

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
      case LoadingWithCacheCategoriesState():
      case LoadedCategoriesState():
        childWidget = const CategoriesContent();
      case ErrorCategoriesState():
        childWidget = Center(
          child: PagePlaceholder(
            title: categoriesState.errorMessage.tr(),
            iconData: Icons.error_outline,
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(title: Text('categories.my_categories'.tr()).tr()),
      body: childWidget,
    );
  }
}

enum CategoriesPageType { all, income, expenses }

class CategoriesContent extends StatefulWidget {
  const CategoriesContent({
    super.key,
    this.onTapCallback,
    this.pageType = CategoriesPageType.all,
  });

  final Function(Category)? onTapCallback;
  final CategoriesPageType pageType;

  @override
  State<CategoriesContent> createState() => _CategoriesContentState();
}

class _CategoriesContentState extends State<CategoriesContent> {
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
    const categoryFilterCutoff = 60;

    final categoriesList = categories.entries.toList();

    switch (widget.pageType) {
      case CategoriesPageType.all:
        break;
      case CategoriesPageType.income:
        categoriesList.retainWhere((final entry) => entry.value.isIncome);
      case CategoriesPageType.expenses:
        categoriesList.retainWhere((final entry) => !entry.value.isIncome);
    }

    if (_searchQuery.isEmpty) {
      return categoriesList;
    }

    final categoryNames = categoriesList
        .map((final entry) => entry.value.name)
        .toList();

    final results = extractAllSorted(
      query: _searchQuery,
      choices: categoryNames,
      cutoff: categoryFilterCutoff,
    );

    return results.map((final result) {
      final categoryIndex = result.index;
      return categoriesList[categoryIndex];
    }).toList();
  }

  @override
  Widget build(final BuildContext context) {
    final categoriesState = context.watch<CategoriesBloc>().state;

    late final List<MapEntry<int, Category>> filteredCategories;

    switch (categoriesState) {
      case LoadingWithCacheCategoriesState():
        filteredCategories = _filterCategories(categoriesState.categories);
      case LoadedCategoriesState():
        filteredCategories = _filterCategories(categoriesState.categories);
      default:
        filteredCategories = <MapEntry<int, Category>>[];
    }

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
                border: const OutlineInputBorder(borderSide: BorderSide.none),
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
                          const Divider(height: 0),
                  itemCount: filteredCategories.length,
                  itemBuilder: (final BuildContext context, final int index) {
                    final categoryEntry = filteredCategories[index];
                    final category = categoryEntry.value;
                    return ListTile(
                      leading: CircleAvatar(
                        child: CategoryEmoji(categoryId: category.id),
                      ),
                      title: Text(category.name),
                      key: ValueKey('category-${category.id}'),
                      onTap: widget.onTapCallback != null
                          ? () {
                              widget.onTapCallback?.call(category);
                              context.pop<Category>(category);
                            }
                          : null,
                    );
                  },
                ),
        ),
        if (categoriesState is LoadingWithCacheCategoriesState &&
            !categoriesState.isFailedToLoad)
          Container(
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  constraints: const BoxConstraints.tightFor(
                    width: 12,
                    height: 12,
                  ),
                  strokeWidth: 3,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'categories.loading_new_data'.tr(),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ],
            ),
          ),
        if (categoriesState is LoadingWithCacheCategoriesState &&
            categoriesState.isFailedToLoad)
          const OfflineModeIndicator(),
      ],
    );
  }
}
