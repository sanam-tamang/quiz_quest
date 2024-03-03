import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_quest/dependency_injection.dart' show init, sl;
import 'package:quiz_quest/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/category_bloc/category_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_point_bloc/quiz_point_bloc.dart';
import 'package:quiz_quest/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<AuthBloc>()),
          BlocProvider(create: (context) => sl<CategoryBloc>()),
          BlocProvider(create: (context) => sl<QuizBloc>()),
          BlocProvider(create: (context) => sl<QuizPointBloc>()),
        ],
        child: MaterialApp.router(
          title: 'Quiz Quest',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: AppRoute.call(),
        ));
  }
}
