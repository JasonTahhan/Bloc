import 'SpaceModel.dart';

class PropertyModel {
 final String propertyId;
 final String propertyName;
 final List<SpaceModel> availableSpaces;

  const PropertyModel({
    required this.propertyId,
    required this.propertyName,
    required this.availableSpaces,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    var availableSpacesData = json['availableSpaces'] as List;
    List<SpaceModel> availableSpaces = availableSpacesData
        .map((spaceJson) => SpaceModel.fromJson(spaceJson))
        .toList();

    return PropertyModel(
      propertyId: json['propertyId'],
      propertyName: json['propertyName'],
      availableSpaces: availableSpaces,
    );
  }

  }