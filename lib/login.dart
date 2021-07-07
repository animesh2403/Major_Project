import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterFcm/auth_provider.dart';
import 'package:flutterFcm/register.dart';
import 'package:flutterFcm/reset.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: isLoading == false
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Column(
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(hintText: "Email",prefixIcon: Icon(Icons.email)),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _password,
                        decoration: InputDecoration(hintText: "Password",prefixIcon: Icon(Icons.lock)),
                      ),
                      SizedBox(height: 20,),
                      FlatButton(
                          color: Colors.blue,
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                            });
                            AuthClass()
                                .signIN(
                                email: _email.text.trim(),
                                password: _password.text.trim())
                                .then((value) {
                              if (value == "Welcome") {
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                        (route) => false);
                              } else {
                                setState(() {
                                  isLoading = false;
                                });
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text(value)));
                              }
                            });
                          },
                          child: Text("Log In ")),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage()));
                          },
                          child: Text("Don't have an account ? Register Here", style: TextStyle(
                            fontSize: 15,
                          ),)
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ResetPage()));
                        },
                        child: Text("Forgot Password?",style: TextStyle(
                            fontSize: 15
                        ),),
                      ),

                      const SizedBox(
                        height: 30,
                      ),
                      //Social Auth Buttons
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                //Sign In with google
                                AuthClass()
                                    .signWithGoogle()
                                    .then((UserCredential value) {
                                  final displayName = value.user.displayName;

                                  print(displayName);

                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePage()),
                                          (route) => false);
                                });
                              },
                              child: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.all(10),
                                  child: Text("Continue with Google"))),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              AuthClass()
                                  .signInWithFacebook()
                                  .then((UserCredential value) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                        (route) => false);
                              });
                            },
                            child: Container(
                              color: Colors.blue,
                              padding: const EdgeInsets.all(10),
                              child: Text("Continue with facebook"),
                            ),
                          ),
                          SizedBox(height: 50,),
                          Container(
                            padding: EdgeInsets.only(top: 100),
                            height: MediaQuery.of(context).size.height/9,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/background.png"),
                                  fit: BoxFit.fitHeight),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
