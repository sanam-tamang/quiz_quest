import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_quest/dependency_injection.dart';
import 'package:quiz_quest/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_point_bloc/quiz_point_bloc.dart';

import 'package:quiz_quest/router.dart';

class AwardPage extends StatefulWidget {
  const AwardPage({super.key});

  @override
  State<AwardPage> createState() => _AwardPageState();
}

class _AwardPageState extends State<AwardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPointBloc, QuizPointState>(
      builder: (context, state) {
        return state.maybeMap(
            loaded: (loaded) => _buildPrize(loaded.totalPoints),
            orElse: () => _buildPrize(0));
      },
    );
  }

  Widget _buildPrize(int totalPoints) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      child: Stack(
        children: [
          //sad
          if (totalPoints <= 20) ...{
            Container(
                child: Lottie.asset(
              "assets/lottie/15.json",
            )),
          },
          //chocolate
          if (totalPoints >= 30) ...{
            if (totalPoints <= 50)
              Image.asset(
                "assets/images/chocolate.png",
              ),
            if (totalPoints >= 60)
              Transform.scale(
                scale: 2,
                child: Lottie.asset(
                  "assets/lottie/1.json",
                  repeat: false,
                  alignment: Alignment.center,
                ),
              ),
            Transform.scale(
                scale: 2, child: Lottie.asset("assets/lottie/14.json")),
          },
          Positioned(
              left: 0,
              right: 0,
              bottom: totalPoints <= 20 ? 0 : 40,
              child: Center(
                child: Card.filled(
                  color: Colors.grey.shade200,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 24),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FilledButton(
                            onPressed: _closeSession,
                            child: const Text("End Session")),
                        const Gap(80),
                        FilledButton(
                            onPressed: _contineuPlaying,
                            child: const Text("Continue Playing")),
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  void _closeSession() {
    context.goNamed(AppRouteName.signUp);
    sl<AuthBloc>().add(const AuthEvent.signOut());

    Future.delayed(
      const Duration(milliseconds: 200),
    ).then((value) => sl<QuizPointBloc>().add(const QuizPointEvent.reset()));
  }

  void _contineuPlaying() {
    context.goNamed(AppRouteName.home);

    Future.delayed(
      const Duration(milliseconds: 200),
    ).then((_) => sl<QuizPointBloc>().add(const QuizPointEvent.reset()));
  }
}
