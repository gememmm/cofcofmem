import '../../domain/entities/coffee.dart';
import '../../domain/repositories/coffee_repository.dart';
import '../datasources/coffee_remote_datasource.dart';
import '../models/coffee_model.dart';
import '../../localdata/database_helper.dart';

class CoffeeRepositoryImpl implements CoffeeRepository {
  final CoffeeRemoteDatasource remoteDatasource;
  final DatabaseHelper databaseHelper;

  CoffeeRepositoryImpl({
    required this.remoteDatasource,
    required this.databaseHelper,
  });

  @override
  Future<List<Coffee>> getCoffees() async {
    try {
      final models = await remoteDatasource.fetchCoffees();
      for (var model in models) {
        await databaseHelper.insertCoffee(model);
      }
      return models.map((model) => Coffee(
        id: model.id,
        title: model.title,
        description: model.description,
        image: model.image,
        ingredients: model.ingredients,
      )).toList();
    } catch (e) {
      final models = await databaseHelper.getCoffees();
      return models.map((model) => Coffee(
        id: model.id,
        title: model.title,
        description: model.description,
        image: model.image,
        ingredients: model.ingredients,
      )).toList();
    }
  }
}
