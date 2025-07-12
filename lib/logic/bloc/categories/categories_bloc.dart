import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/category.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState.initial()) {
    on<LoadCategories>((final event, final emit) async {
      emit(const CategoriesState.loading());
      try {
        final localCategories = await Repositories().localCategoriesRepository
            .fetchCategories();
        if (localCategories.isNotEmpty) {
          emit(
            CategoriesState.loadingWithCache(
              categories: {
                for (final category in localCategories) category.id: category,
              },
              isFailedToLoad: false,
            ),
          );
        }
        try {
          final categories = await Repositories().categoriesRepository
              .fetchCategories();

          await Repositories().localCategoriesRepository.saveCategories(
            categories: categories,
          );

          emit(
            CategoriesState.loaded(
              categories: {
                for (final category in categories) category.id: category,
              },
            ),
          );
        } catch (e) {
          if (state is LoadingWithCacheCategoriesState) {
            final currentState = state as LoadingWithCacheCategoriesState;
            emit(
              CategoriesState.loadingWithCache(
                isFailedToLoad: true,
                categories: currentState.categories,
              ),
            );
          } else {
            emit(CategoriesState.error(errorMessage: e.toString()));
          }
        }
      } catch (e) {
        if (state is LoadingWithCacheCategoriesState) {
          final currentState = state as LoadingWithCacheCategoriesState;
          emit(
            CategoriesState.error(
              errorMessage: e.toString(),
              categories: currentState.categories,
            ),
          );
        } else {
          emit(CategoriesState.error(errorMessage: e.toString()));
        }
      }
    });

    add(const LoadCategories());
  }
}
