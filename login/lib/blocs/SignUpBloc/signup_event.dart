
import 'package:equatable/equatable.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class UpdateFirstNameRequested extends SignUpEvent {
  final String newFirstName;

  UpdateFirstNameRequested(this.newFirstName);

  @override
  List<Object> get props => [newFirstName];
}

class UpdateLastNameRequested extends SignUpEvent {
  final String newLastName;

  UpdateLastNameRequested(this.newLastName);

  @override
  List<Object> get props => [newLastName];
}

class UpdateEmailRequested extends SignUpEvent {
  final String newEmail;

  UpdateEmailRequested(this.newEmail);

  @override
  List<Object> get props => [newEmail];
}

class UpdatePasswordRequested extends SignUpEvent {
  final String newPassword;

  UpdatePasswordRequested(this.newPassword);

  @override
  List<Object> get props => [newPassword];
}

class SignUp extends SignUpEvent {
  @override
  List<Object> get props => [];
}



