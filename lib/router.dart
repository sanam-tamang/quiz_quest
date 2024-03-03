import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_quest/common/bloc_listenable.dart';
import 'package:quiz_quest/common/extensions.dart';
import 'package:quiz_quest/dependency_injection.dart';
import 'package:quiz_quest/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_quest/features/auth/pages/sign_up_page.dart';
import 'package:quiz_quest/features/home/pages/home_page.dart';
import 'package:quiz_quest/features/quiz/pages/quiz_page.dart';

class AppRouteName {
  static const String home = "home";
  static const String signUp = "sign-up";
  static const String signIn = "sign-in";
  // static const String quizCategory = "quiz-category";
  static const String quiz = "quiz";
}

class AppRoute {
  static GoRouter call() {
    return GoRouter(
        initialLocation: AppRouteName.signUp.path,
        redirect: (context, state) {
          final currentPath = state.uri.path;
          bool isAuthPath = currentPath == AppRouteName.signIn.path ||
              currentPath == AppRouteName.signUp.path;
          if (isAuthPath) {
            return sl<AuthBloc>().state.maybeWhen(
                authenticated: (_) => AppRouteName.home.rootPath,
                orElse: () => null);
          } else {
            return null;
          }
        },
        refreshListenable: BlocListenable(sl<AuthBloc>()),
        routes: [
          GoRoute(
            path: AppRouteName.home.rootPath,
            name: AppRouteName.home,
            pageBuilder: (context, state) {
              return _customPage(state, child: const HomePage());
            },
          ),
          GoRoute(
            path: AppRouteName.signUp.path,
            name: AppRouteName.signUp,
            pageBuilder: (context, state) {
              return _customPage(state, child: const SignUpPage());
            },
          ),
          // GoRoute(
          //   path: AppRouteName.signIn.path,
          //   name: AppRouteName.signIn,
          //   pageBuilder: (context, state) {
          //     return _customPage(state, child: const signInPage());
          //   },
          // ),
          GoRoute(
            path: AppRouteName.quiz.path,
            name: AppRouteName.quiz,
            pageBuilder: (context, state) {
              final categoryId = state.uri.queryParameters["categoryId"];
              return _customPage(state,
                  child: QuizPage(categoryId: categoryId!));
            },
          ),
        ]);
  }

  static Page<dynamic> _customPage(GoRouterState state,
      {required Widget child}) {
    return MaterialPage(key: state.pageKey, child: child);
  }
}
