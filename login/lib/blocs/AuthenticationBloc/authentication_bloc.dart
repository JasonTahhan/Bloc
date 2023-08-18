import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login/data/repositories/UserRepository.dart';
import '../../data/Models/UserModel.dart';
import '../../data/repositories/Auth_Repository.dart';
import '../../data/enum/enum_authentication.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationState()) {
    on<UpdateCurrentUser>(_updateCurrentUser);
    on<Signout>(_signOut);
  }

  void _updateCurrentUser(
      UpdateCurrentUser event, Emitter<AuthenticationState> emit) async {
    UserRepository userRepository = UserRepository();
    UserModel? newCurrentUser = await userRepository.getUser();
    if (newCurrentUser != null) {
      emit(state.copywith(
        currentUser: newCurrentUser,
        authenticationStatus: AuthenticationStatus.authenticated,
      ));
    } else {
      emit(state.copywith(
        currentUser: newCurrentUser,
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ));
    }
  }

  void _signOut(Signout event, Emitter<AuthenticationState> emit) async {
    AuthenticationRepository authenticationRepository = AuthenticationRepository();
    try {
      authenticationRepository.signOutUser();
      emit(state.copywith(
        authenticationStatus: AuthenticationStatus.unauthenticated,
      ));
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(
          state.copywith(authenticationStatus: AuthenticationStatus.unknown),
        );
      }
    }
  }
}
