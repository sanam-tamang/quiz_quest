part of 'quiz_point_bloc.dart';

@freezed
class QuizPointState with _$QuizPointState {
  const factory QuizPointState.initial() = _Initial;
  const factory QuizPointState.loaded(
      {required int totalPoints, required Option currentOption}) = _Loaded;
      
}
