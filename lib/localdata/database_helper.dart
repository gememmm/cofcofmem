import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../data/models/user_model.dart';
import '../data/models/coffee_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._();
  static Database? _database;

  DatabaseHelper._();

  factory DatabaseHelper() {
    return _instance;
  }

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'coffee_user_db.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT NOT NULL,
        fullName TEXT NOT NULL,
        email TEXT NOT NULL,
        birthYear INTEGER NOT NULL,
        password TEXT NOT NULL
      )
    ''');
    await db.execute('''
      CREATE TABLE coffees (
        id INTEGER PRIMARY KEY,
        title TEXT,
        description TEXT,
        image TEXT,
        ingredients TEXT
      )
    ''');
  }

  // User related functions
  Future<void> insertUser(UserModel user) async {
    final db = await database;
    await db?.insert('users', user.toJson());
  }

  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('users');

    return List.generate(maps.length, (i) {
      return UserModel(
        username: maps[i]['username'],
        fullName: maps[i]['fullName'],
        email: maps[i]['email'],
        birthYear: maps[i]['birthYear'],
        password: maps[i]['password'],
      );
    });
  }

  // Coffee related functions
  Future<void> insertCoffee(CoffeeModel coffee) async {
    final db = await database;
    await db?.insert('coffees', coffee.toJson());
  }

  Future<List<CoffeeModel>> getCoffees() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('coffees');

    return List.generate(maps.length, (i) {
      return CoffeeModel(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        image: maps[i]['image'],
        ingredients: List<String>.from(maps[i]['ingredients'].split(', ')),
      );
    });
  }
}
