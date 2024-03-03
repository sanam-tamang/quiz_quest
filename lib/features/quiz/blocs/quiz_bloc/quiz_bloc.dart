import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/features/quiz/models/quiz.dart';
import 'package:quiz_quest/features/quiz/repositories/quiz_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';
part 'quiz_bloc.freezed.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final BaseQuizRepository _quizRepo;

  QuizBloc({required BaseQuizRepository quizRepo})
      : _quizRepo = quizRepo,
        super(const _Initial()) {
    on<QuizEvent>((event, emit) async {
      await event.map(get: (event) async => await _onGetQuiz(event, emit));
    });
  }

  Future<void> _onGetQuiz(_Get event, Emitter<QuizState> emit) async {
    emit(const QuizState.loading());
    final failureOrQuizes = await _quizRepo.getQuizes(event.categoryId ?? "");
    failureOrQuizes.fold(
        (l) => emit(QuizState.failure(l)), (r) => emit(QuizState.loaded(r)));
  }
}
