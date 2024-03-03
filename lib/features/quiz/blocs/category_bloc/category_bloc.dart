import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/features/quiz/models/category.dart';
import 'package:quiz_quest/features/quiz/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final BaseQuizCategoryRepository _categoryRepo;

  CategoryBloc({required BaseQuizCategoryRepository categoryRepo})
      : _categoryRepo = categoryRepo,
        super(const _Initial()) {
    on<CategoryEvent>((event, emit) async {
      await event.map(get: (event) async => await _onGetCategory(event, emit));
    });
  }

  Future<void> _onGetCategory(_Get event, Emitter<CategoryState> emit) async {
    emit(const CategoryState.loading());
    final failureOrCategories = await _categoryRepo.getCategories();
    failureOrCategories.fold((l) => emit(CategoryState.failure(l)),
        (r) => emit(CategoryState.loaded(r)));
  }
}
