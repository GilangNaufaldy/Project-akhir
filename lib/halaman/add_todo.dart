import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../models/todo_model.dart';
import 'halaman_utama.dart';



class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late Box<TodoModel> _myBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _myBox = Hive.box(boxName);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(label: Text("Title")),),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(label: Text("Description")),),
              SizedBox(height: 30,),
              OutlinedButton(onPressed: (){
                _myBox.add(TodoModel(title: _titleController.text, description: _descriptionController.text));
                Navigator.pop(context);
              }, child: Text("submit"))
            ],
          ),
        ),
      ),
    );
  }
}
