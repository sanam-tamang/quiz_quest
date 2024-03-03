import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:quiz_quest/common/api.dart';
import 'package:quiz_quest/common/typedef.dart';
import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/core/network/http_repository.dart';
import 'package:quiz_quest/features/auth/models/user.dart';

abstract class BaseAuthRepository {
  FutureEither<User> signIn(
      {required String username, required String password});
  FutureEither<User> signUp(
      {required String username,
      required String name,
      required String password,
      required String institute});
  FutureEither<String> signOut(String userId);
}

class AuthRepository implements BaseAuthRepository {
  final CustomHttp _client;
  AuthRepository({required CustomHttp client}) : _client = client;

  @override
  FutureEither<User> signIn(
      {required String username, required String password}) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

  @override
  FutureEither<String> signOut(String userId) {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  FutureEither<User> signUp(
      {required String username,
      required String name,
      required String password,
      required String institute}) async {
    final uri = Uri.parse("user/".apiBaseUrl);
    final names = name.split("");
    String? firstName = names.firstOrNull;
    String? lastName = names.length >= 2 ? names[1] : null;

    final response = await _client.post(uri, body: {
      "username": username,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "institute": institute,
    });

    return response.fold((l) => Left(l), (r) {
      try {
        if (r.statusCode == 201) {
          final userMap = jsonDecode(r.body);
          final user = User.fromJson(userMap);
          return Right(user);
        } else {
          return Left(ServerError(r.statusCode.toString()));
        }
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    });
  }
}
