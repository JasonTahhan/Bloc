// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import '../../data/Models/UserModel.dart';
import '../../data/enum/enum_authentication.dart';

class AuthenticationState extends Equatable {
final UserModel currentUser;
final AuthenticationStatus authenticationStatus;
const AuthenticationState( 
  {this.currentUser = const UserModel (userId: "", firstName: "" , lastName: "" , email:"" ),
this.authenticationStatus = AuthenticationStatus.unknown});

@override
List<Object> get props => [currentUser, authenticationStatus];
AuthenticationState copywith(
{UserModel? currentUser, AuthenticationStatus? authenticationStatus}){

 return AuthenticationState(
currentUser: currentUser ?? this.currentUser, authenticationStatus:
authenticationStatus ?? this.authenticationStatus);
}
}