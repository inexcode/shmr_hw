part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = InitialCategoriesState;
  const factory CategoriesState.loading() = LoadingCategoriesState;
  const factory CategoriesState.loadingWithCache({
    required final Map<int, Category> categories,
    required final bool isFailedToLoad,
  }) = LoadingWithCacheCategoriesState;
  const factory CategoriesState.loaded({
    required final Map<int, Category> categories,
  }) = LoadedCategoriesState;
  const factory CategoriesState.error({
    required final String errorMessage,
    final Map<int, Category>? categories,
  }) = ErrorCategoriesState;
}
