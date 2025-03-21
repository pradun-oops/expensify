import 'package:flutter/material.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Expen',
          style: TextStyle(
            fontSize: media.width*0.05,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
            fontFamily: 'Metropolis',
            fontStyle: FontStyle.italic,
          ),
        ),
        Text(
          'sify',
          style: TextStyle(
            fontSize: media.width*0.05,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Metropolis',
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }
}
