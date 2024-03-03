part of 'quiz_bloc.dart';

@freezed
class QuizState with _$QuizState {
  const factory QuizState.initial() = _Initial;
  const factory QuizState.loading() = _Loading;
  const factory QuizState.loaded(List<Quiz> quizes) = _Loaded;
  const factory QuizState.failure(Failure f) = _Failure;
}
