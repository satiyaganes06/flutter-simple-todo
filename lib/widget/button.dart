import 'package:flutter/material.dart';
import 'package:todo_app/widget/new_todo.dart';

class FloatButton extends StatefulWidget {

  final Function(String) addTodo;

  FloatButton(this.addTodo);

  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {


  void showNewTodoModalBottomSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (bCtx){
      return NewTodo(widget.addTodo);
    }, isScrollControlled: true);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.lightGreen,
      child: const Icon(
        Icons.add_circle_rounded,
        size: 40,
      ),
      onPressed: () {
        showNewTodoModalBottomSheet(context);
      },
    );
  }
}