import '../models/character.dart';

class MockApiService {
  Future<List<Character>> fetchMockCharacters() async {
    return [
      Character(
        name: 'Harry Potter',
        imageUrl: 'https://i.pinimg.com/enabled_hi/564x/7b/41/5c/7b415c97cd34a33d91dbed812ca330df.jpg', // Используем реальный URL
        house: 'Gryffindor',
        patronus: 'Stag',
      ),
      Character(
        name: 'Hermione Granger',
        imageUrl: 'https://i.pinimg.com/enabled_hi/564x/69/3b/85/693b8598371c2e3517d4c33e09c69456.jpg', // Используем реальный URL
        house: 'Gryffindor',
        patronus: 'Otter',
      ),
    ];
  }
}
