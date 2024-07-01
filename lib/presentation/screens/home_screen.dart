import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/coffee_viewmodel.dart';
import '../widgets/coffee_item.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFAF1),
      appBar: AppBar(
        title: Text('Iced Coffees'),
        backgroundColor: Color(0xFFFFFAF1),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png', height: 75, width: 75,),
                    Text(
                      'CofCofMem',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFFFFFAF1),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Search'),
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
            ),
            ListTile(
              title: Text('Randomizer'),
              onTap: () {
                Navigator.pushNamed(context, '/randomizer');
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Proses logout dan navigasi ke login screen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<CoffeeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (viewModel.coffees.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.coffees.length,
            itemBuilder: (context, index) {
              final coffee = viewModel.coffees[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: coffee);
                },
                child: CoffeeItem(coffee: coffee),
              );
            },
          );
        },
      ),
    );
  }
}
