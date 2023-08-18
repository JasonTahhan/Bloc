import 'package:equatable/equatable.dart';
import 'package:login/data/Models/PropertyModel.dart';

abstract class PropertyEvent extends Equatable {
  const PropertyEvent();

  @override
  List<Object> get props => [];
}

class FetchedProperty extends PropertyEvent {
  @override
  List<Object> get props => [];
}

class SetSelectedProperty extends PropertyEvent {
  final PropertyModel selectedProperty;

  SetSelectedProperty(this.selectedProperty);

  @override
  List<Object> get props => [selectedProperty];
}
