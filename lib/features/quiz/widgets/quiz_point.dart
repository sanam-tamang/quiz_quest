import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_point_bloc/quiz_point_bloc.dart';

class QuizPoint extends StatelessWidget {
  const QuizPoint({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPointBloc, QuizPointState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (loaded) => _buidQuizPoint(context, loaded.totalPoints),
            orElse: () => _buidQuizPoint(context, 0));
      },
    );
  }

  Widget _buidQuizPoint(BuildContext context, int totalPoints) {
    return Column(
      children: [
        if (totalPoints >= 60) Lottie.asset("assets/lottie/12.json"),
        if (totalPoints >= 30 && totalPoints <= 50)
          Lottie.asset("assets/lottie/13.json"),
        if (totalPoints >= 0 && totalPoints <= 20)
          Lottie.asset("assets/lottie/11.json"),
        Text(
          "Your points so far",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          totalPoints.toString(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
