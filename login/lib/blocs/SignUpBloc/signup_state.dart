class SignUpState {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpState({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  SignUpState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? password,
  }) {
    return SignUpState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
