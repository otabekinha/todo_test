import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/pages/home_screen.dart';
import 'package:todoey/provider/save_task.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => TaskController()..init(),
        child: const HomeScreen(),
      ),
    );
  }
}
