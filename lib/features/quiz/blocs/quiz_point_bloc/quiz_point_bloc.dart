import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quiz_quest/features/quiz/models/quiz.dart'
    show $OptionCopyWith, $QuizCopyWith, Option, Quiz;
part 'quiz_point_event.dart';
part 'quiz_point_state.dart';
part 'quiz_point_bloc.freezed.dart';

class QuizPointBloc extends Bloc<QuizPointEvent, QuizPointState> {
  int _totalPoints = 0;
  Option? _currentOption;
  List<Quiz> _quizes = [];
  QuizPointBloc() : super(const _Initial()) {
    on<QuizPointEvent>((event, emit) {
      event.map(
          checkQuizOption: (event) => _onCheckQuizEvent(event, emit),
          reset: (event) => _onReset(event, emit));
    });
  }

  void _onCheckQuizEvent(_CheckQuizOption event, Emitter<QuizPointState> emit) {
    Quiz? comparedQuiz =
        _quizes.firstWhereOrNull((element) => element.id == event.quiz.id);
    if (comparedQuiz != null) {
      emit(QuizPointState.loaded(
          totalPoints: _totalPoints, currentOption: event.option));
      return;
    }
    if (event.option.isCorrect && event.option.id != _currentOption?.id) {
      _totalPoints = _totalPoints + 10;
    }

    _currentOption = event.option;
    _quizes.add(event.quiz);

    emit(QuizPointState.loaded(
        totalPoints: _totalPoints, currentOption: event.option));
  }

  void _onReset(_Reset event, Emitter<QuizPointState> emit) {
    _totalPoints = 0;
    _currentOption = null;
    _quizes = [];
    
    emit(const QuizPointState.initial());
  }
}
