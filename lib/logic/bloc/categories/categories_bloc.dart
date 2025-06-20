import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shmr_hw/config/repositories.dart';
import 'package:shmr_hw/logic/models/category.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(const CategoriesState.initial()) {
    on<_LoadCategories>((final event, final emit) async {
      emit(const CategoriesState.loading());
      try {
        final categories =
            await Repositories.categoryRepository.fetchCategories();
        emit(CategoriesState.loaded(categories: categories));
      } catch (e) {
        emit(CategoriesState.error(errorMessage: e.toString()));
      }
    });
  }
}
