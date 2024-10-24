import 'package:flutter/material.dart';
import 'models/character.dart';
import 'views/character_card.dart';
import 'services/api_service.dart'; // Импортируйте ApiService
import 'services/mock_api_service.dart'; // Импортируйте MockApiService

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Цпибв-41 Рыжов.В.П.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Character>> charactersFuture;
  final ApiService apiService = ApiService();
  final MockApiService mockApiService = MockApiService(); // Инициализируем mockApiService

  @override
  void initState() {
    super.initState();
    // Используйте API или мок в зависимости от Ваших нужд
    // charactersFuture = apiService.fetchCharacters();
    charactersFuture = mockApiService.fetchMockCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Character>>(
        future: charactersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final characters = snapshot.data!;
          return ListView(
            children: characters.map((character) => CharacterCard(character: character)).toList(),
          );
        },
      ),
    );
  }
}
