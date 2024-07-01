import 'package:flutter/material.dart';
import '../../domain/entities/coffee.dart';

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Coffee coffee = ModalRoute.of(context)!.settings.arguments as Coffee;

    return Scaffold(
      backgroundColor: Color(0xFFFFFAF1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFAF1),
        title: Text(coffee.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(coffee.image),
            SizedBox(height: 16.0),
            Text(
              coffee.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(coffee.description),
            SizedBox(height: 8.0),
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...coffee.ingredients.map((ingredient) => Text('- $ingredient')).toList(),
          ],
        ),
      ),
    );
  }
}
