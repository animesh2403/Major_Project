import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterFcm/auth_provider.dart';
import 'package:flutterFcm/login.dart';
import 'Donate.dart';
import 'Quiz_home.dart';
import 'account.dart';
import 'contact us.dart';
import 'payments.dart';
import 'updates.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user = FirebaseAuth.instance.currentUser.email == null
      ? FirebaseAuth.instance.currentUser.phoneNumber
      : FirebaseAuth.instance.currentUser.email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.rectangle,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Icon(Icons.person),
                        ),
                        Container(width: 250,
                          height: 80,
                          child: ElevatedButton(onPressed: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Account()));
                          },
                              child: Container(
                                child: Text('$user'),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:30,
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(
                  'Contact Us',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ContactUs()));
                },
              ),
              ListTile(
                leading: Icon(Icons.sync),
                title: Text(
                  'Check for Updates',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Updates()));
                },
              ),
              ListTile(
                leading: Icon(Icons.money),
                title: Text(
                  'Buy us a Coffee',style: TextStyle(fontSize: 18),),
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Donate()));
                },
              ),

              ListTile(
                leading: Icon(Icons.logout),
                title: Text(
                  'Logout',style: TextStyle(fontSize: 18),),
                onTap: (){
                  showDialog(context: context, builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('LogOut Confirmation'),
                      content: Text('Are you sure you want to LogOut?'),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('No'),),
                        ElevatedButton(onPressed: (){
                          AuthClass().signOut();
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (context) => LoginPage()),
                                  (route) => false);
                          // exit(0);
                        }, child: Text('Yes'),),
                      ],
                    );
                  });
                },
                ),
              ListTile(
                leading: Icon(Icons.exit_to_app_rounded),
                title: Text(
                  'Exit',style: TextStyle(fontSize: 18),),
                onTap: (){
                  showDialog(context: context, builder:(BuildContext context){
                    return AlertDialog(
                      title: Text('Exit from App?'),
                      content: Text('Are you sure you want to exit?'),
                      actions: [
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('No'),),
                        ElevatedButton(onPressed: (){
                          SystemNavigator.pop();
                        }, child: Text('Yes'),),
                      ],
                    );
                  });
                },
              ),
            ],
          ),
        ) ,
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                AuthClass().signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                    (route) => false);
              })
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 30,),

            Text("Welcome  $user"),

            SizedBox(height: 30,),

            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Payment()));
            }, child: Text('Complete your Payment'),),
            SizedBox(height: 60,),
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => Quiz1()));
            },child: Text('Start quiz') ,),
          ],
        ),
      ),
    );
  }
}
