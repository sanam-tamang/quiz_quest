import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_quest/common/widgets/bicte_student_banner.dart';
import 'package:quiz_quest/common/widgets/custom_cache_network_image.dart';
import 'package:quiz_quest/common/widgets/custom_loading_indicator.dart';
import 'package:quiz_quest/dependency_injection.dart';
import 'package:quiz_quest/features/quiz/blocs/category_bloc/category_bloc.dart';
import 'package:quiz_quest/features/quiz/models/category.dart';
import 'package:quiz_quest/router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    _getCategories();
    super.initState();
  }

  void _getCategories() => sl<CategoryBloc>().add(const CategoryEvent.get());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: Container(
          color: Colors.grey.shade200,
        )),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 36),
            child: Card.filled(
                color: Colors.transparent,
                child: SizedBox(
                    width: 900,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: _buildCategory(),
                    )))),
          ),
        ),
      ],
    );
  }

  Widget _buildCategory() {
    return BannerArtWidget(
      text: "BICTE Student",
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          surfaceTintColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              "Quiz Quest",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return state.maybeMap(
                        loading: (_) => const CustomLoadingIndicator(),
                        loaded: (loaded) =>
                            _buildQuizCategory(loaded.categories),
                        orElse: () => const SizedBox.shrink());
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizCategory(List<Category> categories) {
    return ListView.separated(
      itemCount: categories.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.0014)
            ..rotateX(0.3)
            ..scale(0.99),
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 150,
            width: double.maxFinite,
            child: GestureDetector(
              onTap: () => _gotoQuizPage(categories[index].id),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CustomCacheNetworkImage(
                        fit: BoxFit.cover,
                        borderRadius: 36,
                        imageUrl: categories[index].image),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(36),
                          gradient: LinearGradient(
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.3),
                              Colors.black.withOpacity(0.7),
                            ],
                          )),
                      child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5)),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 24,
                    right: 24,
                    child: Text(
                      categories[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(color: Colors.grey.shade200),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 16,
        );
      },
    );
  }

  void _gotoQuizPage(String categoryId) => context.pushNamed(AppRouteName.quiz,
      queryParameters: {"categoryId": categoryId});
}
