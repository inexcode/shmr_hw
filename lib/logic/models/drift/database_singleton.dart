import 'package:shmr_hw/logic/models/drift/database.dart';

class DatabaseSingleton {
  factory DatabaseSingleton() => _instance ??= DatabaseSingleton._();

  DatabaseSingleton._() : _database = Database();

  static DatabaseSingleton? _instance = DatabaseSingleton._();

  final Database _database;
  Database get database => _database;

  Future<void> close() async {
    await _database.close();
  }
}
