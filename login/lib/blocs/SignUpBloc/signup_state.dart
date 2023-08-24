import '../../data/enum/enum_signup.dart';

class SignUpState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final SignUpStatus signUpStatus;

  SignUpState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.signUpStatus,
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    SignUpStatus? signUpStatus
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      signUpStatus: signUpStatus ?? this.signUpStatus,
    );
  }
}
