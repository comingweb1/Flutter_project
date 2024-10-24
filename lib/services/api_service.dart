import 'dart:convert'; // Импорт для работы с JSON
import 'package:http/http.dart' as http; // Импорт для HTTP-запросов
import '../models/character.dart'; // Импорт модели Character

class ApiService {
  final String baseUrl = 'https://api.potterdb.com/v1/characters';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body)['data'];
      return jsonData.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<Character> fetchCharacterById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));

    if (response.statusCode == 200) {
      return Character.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load character');
    }
  }
}
