import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:quiz_quest/common/api.dart';
import 'package:quiz_quest/common/typedef.dart';
import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/core/network/http_repository.dart';
import 'package:quiz_quest/features/quiz/models/quiz.dart' show Quiz;

abstract class BaseQuizRepository {
  FutureEither<List<Quiz>> getQuizes(String categoryId);
}

class QuizRepository implements BaseQuizRepository {
  final CustomHttp _client;
  QuizRepository({required CustomHttp client}) : _client = client;
  @override
  FutureEither<List<Quiz>> getQuizes(String categoryId) async {
    final uri = Uri.parse("question?category_id=$categoryId".apiBaseUrl);
    final response = await _client.get(uri);
    return response.fold((l) => left(l), (r) {
      try {
        if (r.statusCode == 200) {
          final utfString = utf8.decode(r.bodyBytes);

          final quizMap = jsonDecode(utfString);

          final quizes =
              List.from(quizMap).map((e) => Quiz.fromJson(e)).toList();

          return Right(quizes);
        } else {
          return Left(ServerError(r.statusCode.toString()));
        }
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    });
  }
}
