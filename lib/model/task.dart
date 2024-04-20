class Task {
  Task({
    this.id,
    required this.taskName,
    required this.taskCompleted,
  });

  final int? id;
  final String taskName;
  final bool taskCompleted;

  // void toggleDone() {
  //   taskCompleted = !taskCompleted;
  // }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskCompleted': taskCompleted?1:0,
    };
  }

  @override
  String toString() {
    return 'ID: $id,  NAME: $taskName, COMPLETED: $taskCompleted';
  }
}
