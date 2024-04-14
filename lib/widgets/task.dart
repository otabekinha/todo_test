class Task {
  Task({
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });

  final String taskName;
  bool taskCompleted;
  final Function(bool?)? onChanged;

  void toggleDone() {
    taskCompleted = !taskCompleted;
  }
}
