import 'package:flutter/material.dart';
import 'package:flutterFcm/Address.dart';

class Account extends StatefulWidget {
  const Account({key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          SizedBox(height: 80,),
          Center(
            child:  CircleAvatar(
              radius: 50,
              child: Icon(Icons.person),
            ),
          ),
          Container(
            child: Column(
              children: [
                SizedBox(height: 50,),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: Icon(Icons.edit) ,
                          hintText: 'Your Name',
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]))),
                    ),

                    SizedBox(height: 10,),
                    TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.mail),
                          suffixIcon: Icon(Icons.edit),
                          hintText: 'Email',
                          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey[400]),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey[400]))),
                    ),
                  ],
                ),
          ),

          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddAddress()));
          }, child: Text(
            'Add Address'
          ),),
        ],
      ),
      );
  }
}
