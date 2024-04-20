import 'package:flutter/material.dart';
// import 'package:todoey/data/hive_db.dart';
import 'package:todoey/data/sqlite_db.dart';
import 'package:todoey/model/task.dart';

import '../data/local_db.dart';

class TaskController extends ChangeNotifier {
  List<Task> _tasks = [];

  late LocalDb _localDb;

  List<Task> get tasks => _tasks;

  void init() async {
    _localDb = SqliteDb();

    await _localDb.init();

    _tasks = await _localDb.getAll();

    notifyListeners();
  }

  int get taskCount {
    return _tasks.length;
  }

  void saveTask(Task task) {
    _localDb.save(task);
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    // task.toggleDone();
    notifyListeners();
  }
}
