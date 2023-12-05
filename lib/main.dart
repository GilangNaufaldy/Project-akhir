import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'halaman/login_page.dart';
import 'models/todo_model.dart';

String boxName = "TODOBOX";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TodoModel>(TodoModelAdapter());
  await Hive.openBox<TodoModel>(boxName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:LoginPage(),
    );
  }
}