import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todoey/data/local_db.dart';

import '../model/task.dart';

class SqliteDb implements LocalDb {
  late Database _database;

  @override
  Future<List<Task>> getAll() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    return [];
  }

  @override
  Future<void> save(Task task) async {
    _database.insert('tasks', task.toMap());
  }

  @override
  Future<void> init() async {
    _database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      version: 1,
      join(await getDatabasesPath(), 'task.db'),
      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, taskName TEXT, taskCompleted INTEGER NOT NULL)');
      },
    );
  }
}
