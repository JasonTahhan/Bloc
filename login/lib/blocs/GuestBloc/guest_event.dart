
import 'package:equatable/equatable.dart';

sealed class GuestEvent extends Equatable {
const GuestEvent () ;

@override
List<Object> get props => [];
}

class IncrementAdult extends GuestEvent {
 final int adultNb;

  IncrementAdult(this.adultNb);
@override
List<Object> get props => [adultNb];
}

class DecrementAdult extends GuestEvent{
final int adultNb;

  DecrementAdult(this.adultNb);
@override
List<Object> get props => [adultNb];
}


class IncrementChildren extends GuestEvent {
 final int childrenNb;

  IncrementChildren(this.childrenNb);
@override
List<Object> get props => [childrenNb];
}

class DecrementChildren extends GuestEvent{
final int childrenNb;

  DecrementChildren(this.childrenNb);
@override
List<Object> get props => [childrenNb];
}

class NewChildAge extends GuestEvent{
final int newAge;
final int childIndex;

NewChildAge(this.newAge, this.childIndex);
@override
List<Object> get props => [newAge,childIndex];
}

class ClearAll extends GuestEvent{

const ClearAll (); 
@override
List<Object> get props => [];
}



