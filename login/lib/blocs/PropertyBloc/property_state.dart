import 'package:equatable/equatable.dart';
import 'package:login/data/Models/SpaceModel.dart';
import 'package:login/data/enum/enum_property.dart';
import '../../data/Models/PropertyModel.dart';

class PropertyState extends Equatable {
  final List<PropertyModel> listProperty;
  final PropertyModel selectedProperty;
  final PropertyStatus propertyStatus;

  const PropertyState({
    this.listProperty = const [PropertyModel(
      propertyId: '',
      propertyName: '',
      availableSpaces: [SpaceModel(
        spaceId: '',
        propertyName: '',
        spaceTitle: '',
        spaceDescription: '',
        spaceRating: 0.0,
        spacePrice: 0,
        spaceImages: [],
      )],
    )],
    this.selectedProperty = const PropertyModel(
      propertyId: '',
      propertyName: '',
      availableSpaces: [SpaceModel(
        spaceId: '',
        propertyName: '',
        spaceTitle: '',
        spaceDescription: '',
        spaceRating: 0.0,
        spacePrice: 0,
        spaceImages: [],
      )],
    ),
    this.propertyStatus = PropertyStatus.none,
  });

  @override
  List<Object?> get props => [listProperty, propertyStatus, selectedProperty];

  PropertyState copyWith({
    List<PropertyModel>? listProperty,
    PropertyModel? selectedProperty,
    PropertyStatus? propertyStatus,
  }) {
    return PropertyState(
      listProperty: listProperty ?? this.listProperty,
      propertyStatus: propertyStatus ?? this.propertyStatus,
      selectedProperty: selectedProperty ?? this.selectedProperty,
    );
  }
}
