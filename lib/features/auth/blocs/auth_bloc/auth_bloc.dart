import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:quiz_quest/core/failure/failure.dart';
import 'package:quiz_quest/features/auth/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository _repository;
  // User? _currentUser;
  AuthBloc({required BaseAuthRepository authRepo})
      : _repository = authRepo,
        super(const _Initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
          signUp: (event) async => await _onSignUp(event, emit),
          signIn: (event) async => await _onSignIn(event, emit),
          signOut: (event) async => await _onSignOut(event, emit));
    });
  }

  Future<void> _onSignUp(_SignUp e, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final failureOrSignUp = await _repository.signUp(
        username: e.username,
        name: e.name,
        password: e.password,
        institute: e.institute);
    failureOrSignUp.fold((l) => emit(AuthState.failure(l)), (r) {
      // _currentUser = r;
      emit(const AuthState.authenticated("Sesssion Started"));
    });
  }

  Future<void> _onSignIn(_SignIn e, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final failureOrSignIn =
        await _repository.signIn(username: e.username, password: e.password);
    failureOrSignIn.fold((l) => emit(AuthState.failure(l)), (r) {
      // _currentUser = r;
      emit(const AuthState.authenticated("Session Started"));
    });
  }

  Future<void> _onSignOut(_SignOut e, Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    // final failureOrSignOut = await _repository.signOut(e.userId);
    // failureOrSignOut.fold((l) => emit(AuthState.failure(l)), (r) {

    //   emit(const AuthState.authenticated("Session ended"));
    //   Future.delayed(const Duration(milliseconds: 500))
    //       .then((value) => emit(const AuthState.initial()));
    // });

    // _currentUser = null;

    // emit(const AuthState.authenticated("Session ended"));

    emit(const AuthState.initial());
  }
}
