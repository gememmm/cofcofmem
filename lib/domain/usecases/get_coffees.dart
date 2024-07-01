import '../entities/coffee.dart';
import '../repositories/coffee_repository.dart';

class GetCoffees {
  final CoffeeRepository repository;

  GetCoffees({required this.repository});

  Future<List<Coffee>> call() async {
    return await repository.getCoffees();
  }
}
