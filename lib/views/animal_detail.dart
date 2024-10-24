import 'package:flutter/material.dart';
import '../models/animal.dart';

class AnimalDetail extends StatelessWidget {
  final Animal animal;

  const AnimalDetail({Key? key, required this.animal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(animal.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(animal.imageUrl),
            Text(animal.name, style: Theme.of(context).textTheme.headlineLarge),
            Text(animal.sound, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
