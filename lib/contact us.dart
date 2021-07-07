import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child:Text(
                "Developer Email : animeshmishra@gmail.com\n"
                    "Contact Number : 1234567890 \n"
                    "Address : Durg, Chhatisgarh",style: TextStyle(
              fontSize: 18,color: Colors.red,
            ),
            ),
          ),

        ],
      ),
    );
  }
}
