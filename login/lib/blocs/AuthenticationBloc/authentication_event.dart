// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

sealed class AuthenticationEvent extends Equatable {
const AuthenticationEvent () ;

@override
List<Object> get props => [];

}

class UpdateCurrentUser extends AuthenticationEvent {
const UpdateCurrentUser();
@override
List<Object> get props => [];
}

class Signout extends AuthenticationEvent{

const Signout (); 
@override
List<Object> get props => [];

}
