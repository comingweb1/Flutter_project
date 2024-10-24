import 'package:flutter/material.dart';
import '../models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Image.network(character.imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              character.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Text('House: ${character.house}'),
          Text('Patronus: ${character.patronus}'),
        ],
      ),
    );
  }
}
