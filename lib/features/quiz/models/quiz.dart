import 'package:freezed_annotation/freezed_annotation.dart';

part 'quiz.freezed.dart';
part 'quiz.g.dart';

@freezed
class Quiz with _$Quiz {
  const factory Quiz({
    required String id,
    @JsonKey(name: "question_text") required String questionText,
    required List<Option> options,
  }) = _Quiz;
  factory Quiz.fromJson(Map<String, dynamic> json) => _$QuizFromJson(json);
}

@freezed
class Option with _$Option {
  const factory Option(
      {required String id,
      @JsonKey(name: "option_text") required String optionText,
      @JsonKey(name: "is_correct") required bool isCorrect}) = _Option;
  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);
}
