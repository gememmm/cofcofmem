import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/coffee_viewmodel.dart';
import '../../domain/entities/coffee.dart';

class RandomizerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CoffeeViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFFFAF1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFAF1),
        title: Text('Randomizer'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            final randomCoffee = (viewModel.coffees..shuffle()).first;
            Navigator.pushNamed(context, '/detail', arguments: randomCoffee);
          },
          child: Text('What Should I Drink Today?'),
        ),
      ),
    );
  }
}
