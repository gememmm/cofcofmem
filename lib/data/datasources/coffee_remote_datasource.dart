import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/coffee_model.dart';

class CoffeeRemoteDatasource {
  final http.Client client;

  CoffeeRemoteDatasource({required this.client});

  Future<List<CoffeeModel>> fetchCoffees() async {
    final response = await client.get(Uri.parse('https://api.sampleapis.com/coffee/iced'));

    if (response.statusCode == 200) {
      final List<dynamic> coffeesJson = json.decode(response.body);
      print("API Response: $coffeesJson"); // Log the response
      return coffeesJson.map((json) => CoffeeModel.fromJson(json)).toList();
    } else {
      print("Failed to load coffees with status code: ${response.statusCode}");
      throw Exception('Failed to load coffees');
    }
  }
}
