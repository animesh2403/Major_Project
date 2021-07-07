import 'package:flutter/material.dart';
import 'package:flutterFcm/auth_provider.dart';
import 'home.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Register"),
        ),
        body: isLoading == false
            ? Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextField(

                      controller: _email,
                      decoration: InputDecoration(hintText: "Email",
                      prefixIcon: Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
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
                              .createAccount(
                                  email: _email.text.trim(),
                                  password: _password.text.trim())
                              .then((value) {
                            if (value == "Account created") {
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
                        child: Text("Create account")),
                    SizedBox(
                      height: 23,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text("Already have an account? Login "),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      height: MediaQuery.of(context).size.height/5,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/welcome.png"),
                            fit: BoxFit.fitHeight),
                      ),
                    ),
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
