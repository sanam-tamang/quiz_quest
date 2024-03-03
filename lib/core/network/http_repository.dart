import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_quest/common/typedef.dart';
import 'package:quiz_quest/core/internet/internet_checker.dart';
import 'package:quiz_quest/core/failure/failure.dart';

class CustomHttp {
  final InternetChecker _internetChecker;
  final http.Client _client;
  CustomHttp(
      {required InternetChecker internetChecker, required http.Client client})
      : _internetChecker = internetChecker,
        _client = client;
  FutureEither<http.Response> get(Uri url,
      {Map<String, String>? headers}) async {
    if (await _internetChecker.isConnected()) {
      try {
        return Right(await _client.get(url, headers: headers));
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    }
    return Left(InternetFailure());
  }

  FutureEither<http.Response> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (await _internetChecker.isConnected()) {
      return Right(await _client.post(url,
          headers: headers, body: body, encoding: encoding));
    } else {
      return Left(InternetFailure());
    }
  }

  FutureEither<Response> postFiles(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    final formData = FormData.fromMap(data as Map<String, dynamic>);

    if (await _internetChecker.isConnected()) {
      final response = await Dio().post(path,
          data: formData,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return right(response);
    } else {
      return left(InternetFailure());
    }
  }

  FutureEither<http.Response> patch(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (await _internetChecker.isConnected()) {
      try {
        return Right(await _client.patch(url,
            headers: headers, body: body, encoding: encoding));
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    }
    return Left(InternetFailure());
  }

  FutureEither<http.Response> delete(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    if (await _internetChecker.isConnected()) {
      try {
        return Right(await _client.delete(url,
            headers: headers, body: body, encoding: encoding));
      } catch (e) {
        return Left(FailureWithMessage(e.toString()));
      }
    }
    return Left(InternetFailure());
  }
}
