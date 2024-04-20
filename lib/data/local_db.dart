import 'package:todoey/model/task.dart';

abstract class LocalDb {
  Future<void> save(Task task);
  Future<List<Task>> getAll();
  Future<void> init();
}
