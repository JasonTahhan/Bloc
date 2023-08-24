import 'package:bloc/bloc.dart';
import 'package:login/blocs/GuestBloc/guest_event.dart';
import 'package:login/blocs/GuestBloc/guest_state.dart';

class GuestBloc extends Bloc<GuestEvent, GuestState> {
  GuestBloc() : super(GuestState(
    adultNb: 1,
    childrenNb: 0,
    childList: [],
   // allChildrenAge: false,
  )) {
    on<IncrementAdult>(_incrementAdult);
    on<DecrementAdult>(_decrementAdult);
    on<IncrementChildren>(_incrementChildren);
    on<DecrementChildren>(_decrementChildren);
    on<NewChildAge>(_newChildAge);
    on<ClearAll>(_clearAll);
  }

  void _incrementAdult(IncrementAdult event, Emitter<GuestState> emit) {
    final updatedAdultNb = state.adultNb + 1;
    emit(state.copyWith(adultNb: updatedAdultNb));
  }

  void _decrementAdult(DecrementAdult event, Emitter<GuestState> emit) {
  if (state.adultNb > 1) {
    final updatedAdultNb = state.adultNb - 1;
    emit(state.copyWith(adultNb: updatedAdultNb));
  }
}

  void _incrementChildren(IncrementChildren event, Emitter<GuestState> emit) {
    List<int> newChildAge = [...state.childList];
    newChildAge.add(0);
    final  updatedChildrenNb = state.childrenNb + 1;
    emit(state.copyWith(childrenNb: updatedChildrenNb,childList: newChildAge));  }

void _decrementChildren(DecrementChildren event, Emitter<GuestState> emit) {
  List<int> newChildAge = [...state.childList];
  if (state.childrenNb > 0) { 
    newChildAge.removeLast();
    final updatedChildrenNb = state.childrenNb - 1;
    emit(state.copyWith(childrenNb: updatedChildrenNb,childList:newChildAge ));
  }
}

void _newChildAge(NewChildAge event, Emitter<GuestState> emit) {
  List<int> newChildAge = [...state.childList];
  newChildAge[event.childIndex]=event.newAge;
  emit(state.copyWith(childList:newChildAge ));
  // bool checkAge = _checkAge(state.childAge);
  // emit(state.copyWith(allChildrenAge:checkAge ));

}


void _clearAll(ClearAll event, Emitter<GuestState> emit) {
emit(GuestState(adultNb: 1,childrenNb: 0,childList: []));
}
}
