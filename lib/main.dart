import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasources/coffee_remote_datasource.dart';
import 'data/repositories/coffee_repository_impl.dart';
import 'domain/usecases/get_coffees.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/detail_screen.dart';
import 'presentation/screens/search_screen.dart';
import 'presentation/screens/randomizer_screen.dart';
import 'presentation/screens/register_screen.dart';
import 'presentation/screens/login_screen.dart'; // Import LoginScreen
import 'presentation/viewmodels/coffee_viewmodel.dart';
import 'localdata/database_helper.dart';
import 'package:http/http.dart' as http;

void main() {
  final client = http.Client();
  final remoteDatasource = CoffeeRemoteDatasource(client: client);
  final databaseHelper = DatabaseHelper();
  final repository = CoffeeRepositoryImpl(
    remoteDatasource: remoteDatasource,
    databaseHelper: databaseHelper,
  );
  final getCoffees = GetCoffees(repository: repository);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            final viewModel = CoffeeViewModel(getCoffees: getCoffees);
            viewModel.fetchCoffees(); // Fetch coffees on startup
            return viewModel;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoffeeUAS',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      initialRoute: '/login', // Set initial route to login screen
      routes: {
        '/': (context) => HomeScreen(),
        '/detail': (context) => DetailScreen(),
        '/search': (context) => SearchScreen(),
        '/randomizer': (context) => RandomizerScreen(),
        '/register': (context) => RegisterScreen(),
        '/login': (context) => LoginScreen(), // Add route for LoginScreen
      },
    );
  }
}
