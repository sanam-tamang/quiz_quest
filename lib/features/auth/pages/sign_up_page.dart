import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_quest/common/extensions.dart';
import 'package:quiz_quest/common/utils/custom_toast.dart';
import 'package:quiz_quest/common/utils/floating_loading_indicator.dart';
import 'package:quiz_quest/common/widgets/blur_image_widget.dart';
import 'package:quiz_quest/common/widgets/custom_text_field.dart';

import 'package:quiz_quest/dependency_injection.dart';
import 'package:quiz_quest/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:toastification/toastification.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _nameController;
  // late TextEditingController _instituteController;

  @override
  void initState() {
    _nameController = TextEditingController();
    // _instituteController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    // _instituteController = TextEditingController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlurImageBackgroundWidget.asset(child: _buildSignUp());
  }

  Scaffold _buildSignUp() {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            width: 460,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "Quiz Quest",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(color: Colors.grey.shade200),
                    ),
                  ),
                  const Gap(36),
                  Card.filled(
                    color: Colors.grey.shade200,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 36),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Start Session",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall),
                          const Gap(32),
                          CustomTextField(
                              hintText: "Enter a full name of player",
                              labelText: "Full name",
                              controller: _nameController),
                          const Gap(32),
                          BlocListener<AuthBloc, AuthState>(
                            listener: (context, state) =>
                                _authListener(context, state),
                            child: SizedBox(
                              width: 400,
                              child: FilledButton(
                                  onPressed: _onSignUp,
                                  child: const Text("Start")),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Gap(150),
                ],
              ),
            ),
          ),
        ));
  }

  void _authListener(BuildContext context, AuthState state) {
    state.mapOrNull(
        loading: (_) => floatingLoadingIndicator(context),
        authenticated: (authenticated) {
          showToast(context, authenticated.message);
          context.pop();
        },
        failure: (failure) {
          showToast(context, failure.f.getMessage,
              type: ToastificationType.error);
          context.pop();
        });
  }

  void _onSignUp() {
    final randNumber = Random().nextInt(10000) + 1000;
    String username = _nameController.text.split("").firstOrNull ?? "rand";
    username = username + randNumber.toString();
    sl<AuthBloc>().add(AuthEvent.signUp(
        username: username,
        name: _nameController.text,
        password: "123456",
        institute: ""));
  }
}
