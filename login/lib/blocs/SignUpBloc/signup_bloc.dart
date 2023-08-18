import 'package:bloc/bloc.dart';
import 'package:login/data/repositories/Auth_Repository.dart';
import 'signup_event.dart';
import 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState(firstName: 'null', lastName: 'null', email: 'null', password: 'null')) {
    on<UpdateFirstNameRequested>((event, emit) {
      emit(state.copyWith(firstName: event.newFirstName));
    });

    on<UpdateLastNameRequested>((event, emit) {
      emit(state.copyWith(lastName: event.newLastName));
    });

    on<UpdateEmailRequested>((event, emit) {
      emit(state.copyWith(email: event.newEmail));
    });

    on<UpdatePasswordRequested>((event, emit) {
      emit(state.copyWith(password: event.newPassword));
    });

    on<SignUp>((event, emit) async {
      await AuthenticationRepository().AddToFirestore(
        email: state.email,
        password: state.password,
        firstName: state.firstName,
        lastName: state.lastName,
      );
    });
  }
}
