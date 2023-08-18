import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Models/PropertyModel.dart';

class PropertyService {
  Future<List<PropertyModel>> getAllAvailableProperties() async {
    try {
      var response = await http.get(Uri.parse('http://192.168.88.10:31535/otonomus/inventory/api/v1/spaces/available_spaces'));
      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(response.body);
        var result = decodedResponse['data'] as List<dynamic>;
        final finalResponse = result.map((map) => PropertyModel.fromJson(map)).toList();
        return finalResponse;
      } else {
        return [];
      }
    } catch (e) {
      print('Error getting all available properties: $e');
      return [];
    }
  }
}

