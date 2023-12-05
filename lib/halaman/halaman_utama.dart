import 'package:flutter/material.dart';
import 'package:ta_final/halaman/profile.dart';
import '../models/todo_model.dart';
import 'kesan.dart';
import 'menu.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';


String boxName = "TODOBOX";
void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<TodoModel>(TodoModelAdapter());
  await Hive.openBox<TodoModel>(boxName);
  runApp(const HalamanUtama());
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Menu(),
    Profile(),
    TodoList(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Scaffold(
          backgroundColor: Colors.red[100],
            appBar : AppBar(
              title: _selectedIndex == 0
                  ? Text("Home Page")
                  : _selectedIndex == 1
                  ? Text("Profile")
                  : Text("Kesan"),
              backgroundColor: Colors.red,
            ),
          body: Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: "kesan")
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ));
  }
}