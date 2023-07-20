import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToDoCards extends StatelessWidget {
  
  final int _id;
  final String _task;
  final bool _isCheck;
  final int index;
  final Function(int) updateIsCheck;

  ToDoCards(this._id, this._task, this._isCheck, this.updateIsCheck, this.index);

  @override
  Widget build(BuildContext context) {
    /* FractionallySizedBox by using this we can resposive a widget 
    using percetage */
    return GestureDetector(
      onTap: (){
        updateIsCheck(index);
      },
      child: FractionallySizedBox(
        widthFactor: 0.9,
        child: Card(
          child: Container( 
            padding: const EdgeInsets.all(20),
            height: 100,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_task,
                      style: GoogleFonts.kanit(
                        textStyle: const TextStyle(
                          fontSize: 18,
                        )
                      )
                    ), 
                    Icon(
                      //Ternary operator
                      _isCheck ? Icons.check : Icons.close,
                      color: _isCheck ? Colors.green : Colors.red,
                      size: 30,
                    ),
                  ]
              )
            )
          )
        )
      )
    );
  }
}