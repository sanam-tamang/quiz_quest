import 'package:expandable_page_view/expandable_page_view.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_quest/common/widgets/bicte_student_banner.dart';
import 'package:quiz_quest/common/widgets/custom_loading_indicator.dart';
import 'package:quiz_quest/dependency_injection.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_bloc/quiz_bloc.dart';
import 'package:quiz_quest/features/quiz/blocs/quiz_point_bloc/quiz_point_bloc.dart';
import 'package:quiz_quest/features/quiz/models/quiz.dart';
import 'package:quiz_quest/features/quiz/pages/award_page.dart';
import 'package:quiz_quest/features/quiz/widgets/quiz_point.dart';
import 'package:quiz_quest/router.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key, required this.categoryId});
  final String categoryId;
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late PageController _quizController;
  int currentPage = 0;
  @override
  void initState() {
    _quizController = PageController()..addListener(_listenPageController);
    _getQuizes();
    super.initState();
  }

  void _listenPageController() {
    setState(() {
      currentPage =
          _quizController.page == null ? 0 : _quizController.page!.floor();
    });
  }

  @override
  void dispose() {
    _quizController.dispose();
    _quizController.removeListener(_listenPageController);

    super.dispose();
  }

  void _getQuizes() => sl<QuizBloc>().add(QuizEvent.get(widget.categoryId));
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuizPointBloc, QuizPointState>(
      builder: (context, state) {
        return PopScope(
          canPop: state.maybeMap(loaded: (_) => false, orElse: () => true),
          onPopInvoked: (didPop) => state.maybeMap(
              loaded: (_) => _onPopInvoke(context), orElse: () => () {}),
          child: Stack(
            children: [
              Positioned.fill(child: _buildQuiz()),
              const Positioned(
                  top: -100,
                  right: -150,
                  child: CircleWidget(
                    color: Colors.purple,
                    size: Size(300, 300),
                    stroke: 8,
                  )),
              // const Positioned(
              //     top: 150,
              //     right: 0,
              //     left: 0,
              //     child: FullCirlceWidget(
              //       radius: 80,
              //     )),
              const Positioned(
                  top: 500,
                  right: 100,
                  child: FullCirlceWidget(
                    radius: 55,
                    color: Colors.indigo,
                  )),
            ],
          ),
        );
      },
    );
  }

  Future<Object?> _onPopInvoke(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedSlide(
          offset: Offset(0, animation.value),
          duration: const Duration(milliseconds: 200),
          child: AlertDialog.adaptive(
            title: const Text("Exit Playing"),
            content: const Text("Do you want to exit playing?"),
            actionsAlignment: MainAxisAlignment.spaceBetween,
            actions: [
              OutlinedButton(
                  onPressed: () => context.pop(), child: const Text("Close")),
              FilledButton(onPressed: _exitQuiz, child: const Text("Exit")),
            ],
          ),
        );
      },
    );
  }

  void _exitQuiz() {
    context.goNamed(AppRouteName.home);
    Future.delayed(const Duration(milliseconds: 100));
    sl<QuizPointBloc>().add(const QuizPointEvent.reset());
  }

  Widget _buildQuiz() {
    return BannerArtWidget(
      text: 'BICTE Student',
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        // extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(flex: 2, child: _quizBloc()),
              const Gap(24),
              const Expanded(child: QuizPoint()),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<QuizBloc, QuizState> _quizBloc() {
    return BlocBuilder<QuizBloc, QuizState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: state.maybeMap(
              loading: (_) => const CustomLoadingIndicator(),
              loaded: (loaded) => _buildQuizes(loaded.quizes),
              orElse: () => const SizedBox.shrink()),
        );
      },
    );
  }

  Widget _buildQuizes(List<Quiz> quizes) {
    return quizes.isEmpty
        ? Center(
            child: Text(
            "This category has not quizes",
            style: Theme.of(context).textTheme.headlineLarge,
          ))
        : Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "step ${currentPage + 1}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " of ${quizes.length}",
                        style: Theme.of(context).textTheme.labelLarge),
                  ])),
                  const Gap(4),
                  StepProgressIndicator(
                    totalSteps: quizes.length,
                    currentStep: currentPage + 1,
                    selectedColor: Colors.indigoAccent,
                    unselectedColor: Colors.grey.shade500,
                  ),
                ],
              ),
              Positioned(
                top: 32,
                left: 0,
                right: 0,
                child: Card.filled(
                  color: Colors.grey.shade50,
                  child: ExpandablePageView.builder(
                    controller: _quizController,
                    itemCount: quizes.length,
                    itemBuilder: (context, index) {
                      final quiz = quizes[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 32, horizontal: 24),
                        child: __buildQuizCard(quiz, context, quizes.length),
                      );
                    },
                  ),
                ),
              ),
              const Positioned(
                right: -70,
                top: 35,
                child: FullCirlceWidget(
                  radius: 80,
                ),
              ),
            ],
          );
  }

  Column __buildQuizCard(Quiz quiz, BuildContext context, int maxQuizLength) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          quiz.questionText,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "Answer and get points",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Gap(16),
        ...quiz.options.map((e) {
          return BlocBuilder<QuizPointBloc, QuizPointState>(
            builder: (context, state) {
              return state.maybeMap(
                  loaded: (loaded) => __optionCard(
                      e, quiz, loaded.currentOption.id == e.id, maxQuizLength),
                  orElse: () => __optionCard(e, quiz, false, maxQuizLength));
            },
          );
        }),
      ],
    );
  }

  Padding __optionCard(
      Option e, Quiz quiz, bool isSelected, int maxQuizLength) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () => _updateQuizPoint(e, quiz, maxQuizLength),
        child: Card.outlined(
            color: isSelected ? Colors.blueGrey : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: SizedBox(
                width: double.maxFinite,
                child: Text(
                  e.optionText,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: isSelected ? Colors.grey.shade100 : null),
                ),
              ),
            )),
      ),
    );
  }

  void _nextQuestion() => _quizController.nextPage(
      duration: const Duration(milliseconds: 150), curve: Curves.easeIn);

  void _updateQuizPoint(Option option, Quiz quiz, int maxQuizLength) {
    if (currentPage + 1 == maxQuizLength) {
      _showAwardPage();
    }
    sl<QuizPointBloc>()
        .add(QuizPointEvent.checkQuizOption(option: option, quiz: quiz));
    Future.delayed(const Duration(milliseconds: 300));
    _nextQuestion();
  }

  void _showAwardPage() {
    showGeneralDialog(
      context: context,
      // barrierDismissible: true,
      barrierColor: Colors.transparent,
      // barrierLabel: "Close",
      pageBuilder: (context, animation, secondaryAnimation) {
        return AnimatedSlide(
          offset: Offset(0, animation.value),
          duration: const Duration(milliseconds: 150),
          child: const AwardPage(),
        );
      },
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
    this.stroke,
    this.circleValue,
    this.color,
    this.size,
  });

  final double? stroke;
  final double? circleValue;
  final Color? color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: size?.height ?? 100,
        width: size?.width ?? 100,
        child: CircularProgressIndicator(
          value: circleValue ?? 0.99,
          color: color?.withOpacity(0.7) ?? Colors.indigo,
          strokeWidth: stroke ?? 5,
        ));
  }
}

class FullCirlceWidget extends StatelessWidget {
  const FullCirlceWidget({
    super.key,
    this.radius,
    this.color,
  });

  final double? radius;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CircleAvatar(
        radius: radius ?? 10,
        backgroundColor:
            color?.withOpacity(0.1) ?? Colors.blueGrey.withOpacity(0.07),
      ),
    );
  }
}
