import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widget/todo_cards.dart';


class Scrollable_List extends StatelessWidget {
  
  final List<ToDoModel> todoList;
  final Function(int) updateIsCheck;

  Scrollable_List(this.todoList, this.updateIsCheck);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
       child: ListView.builder(itemBuilder: (ctx, i){
           return ToDoCards(
             todoList[i].id, 
             todoList[i].task, 
             todoList[i].isCheck,
             updateIsCheck,
             i
            );
         }, 
         itemCount: todoList.length,
       ),
    );
  }
}