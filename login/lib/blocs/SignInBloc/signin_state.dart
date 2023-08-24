import 'package:login/data/enum/enum_signin.dart';

class SignInState {
  final String email;
  final String password;
  final SignInStatus signInStatus;

  SignInState({
    required this.email,
    required this.password,
    required this.signInStatus,
  });

  SignInState copyWith({
    String? email,
    String? password,
    SignInStatus? signInStatus
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      signInStatus: signInStatus ?? this.signInStatus,
    );
  }
}
