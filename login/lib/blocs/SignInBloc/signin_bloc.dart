import 'package:bloc/bloc.dart';
import 'package:login/data/repositories/Auth_Repository.dart';
import 'signin_event.dart';
import 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState(email: 'null', password: 'null')) {

    on<UpdateEmailRequested>((event, emit) {
      emit(state.copyWith(email: event.newEmail));
    });

    on<UpdatePasswordRequested>((event, emit) {
      emit(state.copyWith(password: event.newPassword));
    });

    on<SignIn>((event, emit) async {
      await AuthenticationRepository().login(
        email: state.email,
        password: state.password,
      );
    });
  }
}
