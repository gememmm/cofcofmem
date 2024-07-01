import 'package:flutter/material.dart';
import '../../domain/entities/coffee.dart';

class CoffeeItem extends StatelessWidget {
  final Coffee coffee;

  CoffeeItem({required this.coffee});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(
            coffee.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
            errorBuilder: (context, error, stackTrace) => Icon(Icons.error), // Handle image errors
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(coffee.title),
          ),
        ],
      ),
    );
  }
}
