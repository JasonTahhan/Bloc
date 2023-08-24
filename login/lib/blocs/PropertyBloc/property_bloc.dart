import 'package:bloc/bloc.dart';
import 'package:login/blocs/PropertyBloc/property_event.dart';
import 'package:login/blocs/PropertyBloc/property_state.dart';

import '../../data/Models/PropertyModel.dart';
import '../../data/repositories/PropertyRepository.dart';
import '../../data/enum/enum_property.dart';



class PropertyBloc extends Bloc<PropertyEvent, PropertyState> {
  PropertyBloc() : super(PropertyState()) {
    on<FetchedProperty>(_fetchProperty);
    on<SetSelectedProperty>(_setSelectedProperty);
  }

  void _fetchProperty(
      FetchedProperty event, Emitter<PropertyState> emit) async {
    PropertyService propertyService = PropertyService();
    try {
      List<PropertyModel> listProperty =
          await propertyService.getAllAvailableProperties();
      emit(state.copyWith(
        listProperty: listProperty,
        selectedProperty: listProperty[0],
        propertyStatus: PropertyStatus.available,
      ));
    } catch (e) {
      emit(state.copyWith(propertyStatus: PropertyStatus.error));
    }
  }

  void _setSelectedProperty(
      SetSelectedProperty event, Emitter<PropertyState> emit) {
    emit(state.copyWith(selectedProperty: event.selectedProperty));
  }
}
