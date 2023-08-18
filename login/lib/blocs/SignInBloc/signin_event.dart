import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class UpdateEmailRequested extends SignInEvent {
  final String newEmail;

  UpdateEmailRequested(this.newEmail);

  @override
  List<Object> get props => [newEmail];
}

class UpdatePasswordRequested extends SignInEvent {
  final String newPassword;

  UpdatePasswordRequested(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

class SignIn extends SignInEvent {
  @override
  List<Object> get props => [];
}
