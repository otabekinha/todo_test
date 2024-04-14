import 'package:flutter/material.dart';
import 'package:todoey/widgets/task.dart';

class SaveTask extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      taskName: 'Banana',
      taskCompleted: false,
      onChanged: (p) {},
    ),
    Task(
      taskName: 'Apple',
      taskCompleted: false,
      onChanged: (p) {},
    ),
  ];

  List<Task> get tasks => _tasks;

  int get taskCount {
    return _tasks.length;
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }
  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }


}
