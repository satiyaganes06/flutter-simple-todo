import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CounterText extends StatelessWidget {

  final int _current_Work;
  final int _total_Work;

  CounterText(this._current_Work, this._total_Work);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text('$_current_Work / $_total_Work',
        style: GoogleFonts.oswald(
          fontSize:60,
          letterSpacing:2,
          color: Colors.red[300],
        )
      ),
  
    );
  }
}