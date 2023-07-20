
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/models/todo_model.dart';

class NewTodo extends StatefulWidget {
  
  final Function(String) addTodo;

  NewTodo(this.addTodo);

  @override
  _NewTodoState createState() => _NewTodoState();
}

class _NewTodoState extends State<NewTodo> {

  var _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white70,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: _todoController,
                decoration: const InputDecoration(
                  labelText: 'New Task',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.note_add_outlined),
                ),
                maxLength: 15,
              ),
            ),
            ElevatedButton(
              onPressed: ()=> validate(),
              child: const Text('Save'),
            )
          ],
        )
      ) 
    );
  }

  void validate(){
    if(_todoController.text.isEmpty){
      Fluttertoast.showToast(msg: "Input field is empty.");
    }else{
      widget.addTodo(_todoController.text);
      Navigator.of(context).pop();
    }
  }
}