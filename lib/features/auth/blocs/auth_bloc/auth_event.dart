part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUp({required String username,
      required String name,
      required String password,
      required String institute}) = _SignUp;
  const factory AuthEvent.signIn({required String username,
      required String password, }) = _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
