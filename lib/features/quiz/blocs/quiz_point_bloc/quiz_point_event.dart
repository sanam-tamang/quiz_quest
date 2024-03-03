part of 'quiz_point_bloc.dart';

@freezed
class QuizPointEvent with _$QuizPointEvent {
  const factory QuizPointEvent.checkQuizOption({required Option option, required Quiz quiz} ) = _CheckQuizOption;
  const factory QuizPointEvent.reset() =
      _Reset;
}