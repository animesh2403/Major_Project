import 'package:flutter/material.dart';

class Updates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("No new updates available, \n "
            "This is the latest version!!",textAlign: TextAlign.center,style: TextStyle(

          fontSize: 20,
        ),),
      ),
    );
  }
}
