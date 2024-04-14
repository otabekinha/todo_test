import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/provider/save_task.dart';
import 'package:todoey/widgets/bottom_sheet.dart';
import 'package:todoey/widgets/task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  void addNewTask() {
    context.read<SaveTask>().addTask(
          Task(
            taskName: _controller.text,
            taskCompleted: false,
          ),
        );
    _controller.clear();
    Navigator.of(context).pop();
  }

  void onDeleteTask(Task task) {
    context.read<SaveTask>().deleteTask(task);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (ctx) => BuildBottomSheet(
              controller: _controller,
              onCreateNewTask: addNewTask,
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      backgroundColor: Colors.pink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
              bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.pink,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${Provider.of<SaveTask>(context).taskCount} Tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Consumer<SaveTask>(
                builder: (context, task, child) {
                  return ListView.builder(
                    itemCount: task.taskCount,
                    itemBuilder: (BuildContext context, index) {
                      final currentTask = task.tasks[index];
                      return ListTile(
                        onLongPress: () => onDeleteTask(currentTask),
                        title: Text(
                          task.tasks[index].taskName,
                          style: TextStyle(
                            fontSize: 18,
                            decoration: currentTask.taskCompleted
                                ? TextDecoration.lineThrough
                                : null,
                          ),
                        ),
                        trailing: Checkbox(
                          activeColor: Colors.pink,
                          value: task.tasks[index].taskCompleted,
                          onChanged: (newValue) {
                            task.updateTask(task.tasks[index]);
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
