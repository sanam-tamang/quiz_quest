import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:quiz_quest/core/internet/internet_checker.dart';
import 'package:quiz_quest/core/network/http_repository.dart';
import 'package:quiz_quest/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_quest/features/auth/repositories/auth_repository.dart';
import 'package:quiz_quest/features/quiz/blocs/category_bloc/category_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_point_bloc/quiz_point_bloc.dart';
import 'package:quiz_quest/features/quiz/repositories/category_repository.dart';
import 'package:quiz_quest/features/quiz/repositories/quiz_repository.dart';

GetIt sl = GetIt.instance;

void init() {

  //Blocs
  sl.registerLazySingleton(() => AuthBloc(authRepo: sl()));
  sl.registerLazySingleton(() => CategoryBloc(categoryRepo: sl()));
  sl.registerLazySingleton(() => QuizBloc(quizRepo: sl()));
  sl.registerLazySingleton(() => QuizPointBloc());


//Repositories
  sl.registerLazySingleton<BaseAuthRepository>(
      () => AuthRepository(client: sl()));

  sl.registerLazySingleton<BaseQuizCategoryRepository>(
      () => QuizCategoryRepository(client: sl()));

  sl.registerLazySingleton<BaseQuizRepository>(
      () => QuizRepository(client: sl()));


//core
  sl.registerLazySingleton(
      () => CustomHttp(internetChecker: sl(), client: sl()));
  sl.registerLazySingleton(() => InternetChecker(connectivity: sl()));

  //External 
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => Client());
}
