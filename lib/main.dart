import 'dart:math';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widget/counter.dart';
import 'package:todo_app/widget/button.dart';
import 'package:todo_app/widget/scrollable_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState(){
    return _MyHomePageState();
  } 
}

class _MyHomePageState extends State<MyHomePage> {

  var toDoList = <ToDoModel>[
    ToDoModel(52467362, 'Maths Homework', false),
    ToDoModel(72424328, 'Science Homework', false),
    ToDoModel(29849434, 'BM Homework', true),
    ToDoModel(32900849, 'Assignment', true)
  ];

  int calcTotalCheck(){
    var totalCheck = 0;

    for(int i=0 ; i<toDoList.length ; i++){
      if(toDoList[i].isCheck == true){
        totalCheck++;
      }
    }

    return totalCheck;
  }

  void updateToDoIsCheck(int index){

    setState(() {
      //this code is like toggle, if its true then false, or flase then true
      toDoList[index].isCheck = !toDoList[index].isCheck;
    });
    
  }
  
  void _addTodo(String newTask){
    setState(() {
      toDoList.add(ToDoModel(Random().nextInt(8), newTask , false));
    });

    Fluttertoast.showToast(msg: 'Added !!!', 
    gravity: ToastGravity.BOTTOM);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // themeMode: ThemeMode.dark,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: const Text('To Doo',
          style: TextStyle(
              letterSpacing: 1,
          )), 
          centerTitle: true,
        
        ),
        
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterText(calcTotalCheck(), toDoList.length),

              // ...toDoList.map((todo) => ToDoCards(
              //   todo.id,
              //   todo.task, 
              //   todo.isCheck
              // ),)

              Scrollable_List(toDoList, updateToDoIsCheck)
            ]
          )
        ),
        
        floatingActionButton: FloatButton(_addTodo),
        
      ),
    );
  }
}

