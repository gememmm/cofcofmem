import 'package:flutter/material.dart';
import '../../domain/entities/coffee.dart';
import '../../domain/usecases/get_coffees.dart';

class CoffeeViewModel extends ChangeNotifier {
  final GetCoffees getCoffees;
  List<Coffee> coffees = [];
  bool isLoading = false;

  CoffeeViewModel({required this.getCoffees});

  Future<void> fetchCoffees() async {
    isLoading = true;
    notifyListeners();
    coffees = await getCoffees();
    print("Coffees fetched: $coffees"); // Log the fetched data
    isLoading = false;
    notifyListeners();
  }
}
