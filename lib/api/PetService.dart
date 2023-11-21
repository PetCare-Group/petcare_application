import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Pet.dart';

class PetService {
  Future<List<Pet>> fetchPets() async {
    final response = await http.get(Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/pet'));

    if (response.statusCode == 200) {
      List<dynamic> petsJson = json.decode(response.body);
      return petsJson.map((json) => Pet.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pets');
    }
  }

  Future<void> addPet(Map<String, dynamic> newPet) async {
    final url = Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/pet');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newPet),
    );

    if (response.statusCode == 200) {
      // Si el servidor devuelve una respuesta OK, decodificamos y procedemos.
      print('Pet created successfully.');
    } else {
      // Si el servidor no devuelve una respuesta OK, lanzamos un error.
      throw Exception('Failed to create a new pet. Status code: ${response.statusCode}');
    }
  }

  Future<void> deletePet(int id) async {
    final url = Uri.parse('https://petcarebackend.azurewebsites.net/api/v1/pet/$id');
    final response = await http.delete(url);

    if (response.statusCode != 200) {
      throw Exception('Failed to delete pet. Status code: ${response.statusCode}');
    }
  }

}
