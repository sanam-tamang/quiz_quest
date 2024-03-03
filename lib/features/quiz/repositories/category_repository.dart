import 'dart:convert';

import 'package:dartz/dartz.dart';

import 'package:quiz_quest/common/api.dart';
import 'package:quiz_quest/common/typedef.dart';
import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/core/network/http_repository.dart';
import 'package:quiz_quest/features/quiz/models/category.dart' show Category;

abstract class BaseQuizCategoryRepository {
  FutureEither<List<Category>> getCategories();
}

class QuizCategoryRepository implements BaseQuizCategoryRepository {
  final CustomHttp _client;
  QuizCategoryRepository({required CustomHttp client}) : _client = client;
  @override
  FutureEither<List<Category>> getCategories() async {
    final uri = Uri.parse("category".apiBaseUrl);
    final response = await _client.get(uri);
    return response.fold((l) => left(l), (r) {
      try {
        if (r.statusCode == 200) {
          final categoryMap = jsonDecode(r.body);
          final categories =
              List.from(categoryMap).map((e) => Category.fromJson(e)).toList();
          return Right(categories);
        } else {
          return Left(ServerError(r.statusCode.toString()));
        }
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    });
  }
}
