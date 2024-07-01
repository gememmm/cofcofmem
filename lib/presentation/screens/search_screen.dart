import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/coffee_viewmodel.dart';
import '../widgets/coffee_item.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CoffeeViewModel>(context);

    return Scaffold(
      backgroundColor: Color(0xFFFFFAF1),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFAF1),
        title: Text('Search Coffees'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.68, // Adjust the aspect ratio as needed
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: viewModel.coffees
                  .where((coffee) =>
                  coffee.title.toLowerCase().contains(query.toLowerCase()))
                  .length,
              itemBuilder: (context, index) {
                final coffee = viewModel.coffees
                    .where((coffee) =>
                    coffee.title.toLowerCase().contains(query.toLowerCase()))
                    .toList()[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/detail', arguments: coffee);
                  },
                  child: CoffeeItem(coffee: coffee),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
