class SpaceModel {
  final String spaceId;
  final String propertyName;
  final String spaceTitle;
  final String spaceDescription;
  final double spaceRating;
  final int spacePrice;
  final List<String> spaceImages;

  const SpaceModel({
    required this.spaceId,
    required this.propertyName,
    required this.spaceTitle,
    required this.spaceDescription,
    required this.spaceRating,
    required this.spacePrice,
    required this.spaceImages,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) {
    var spaceImagesData = json['spaceImages'] as List;
    List<String> spaceImages =
    spaceImagesData.map((imageUrl) => imageUrl.toString()).toList();

    return SpaceModel(
      spaceId: json['spaceId'],
      propertyName: json['propertyName'],
      spaceTitle: json['spaceTitle'],
      spaceDescription: json['spaceDescription'],
      spaceRating: json['spaceRating'],
      spacePrice: json['spacePrice'],
      spaceImages: spaceImages,
    );
  }
  @override
  String toString() {
    return 'SpaceModel(spaceId: $spaceId, propertyName: $propertyName, spaceTitle: $spaceTitle, spaceDescription: $spaceDescription, spaceRating: $spaceRating, spacePrice: $spacePrice, spaceImages: $spaceImages)';
  }
  }