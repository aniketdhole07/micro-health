import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  String _email;
  String _password;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
        // Navigator.of(context).pop();
      }
    });
  }

  naviagteToSignupPage() {
    Navigator.pushReplacementNamed(context, "/SignupPage");
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  void signin() async {
    debugPrint("entering sign in function");
    if (_formkey.currentState.validate()) {
      debugPrint("entering if");
      _formkey.currentState.save();
      try {
        // ignore: unused_local_variable
        FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: _email, password: _password));
        debugPrint("entering try");
      } catch (e) {
        showError(e.message);
      }
    }
  }

  showError(String error) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('ERROR'),
            content: Text(error),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context)
                      .pop(); //pop whatever the active region is.
                },
                child: Text('OK'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Micro Doctor - AVR IoT + Heart Rate'),
      ),
      body: Container(
          child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
              child: Image(
                image: AssetImage("images/logo.gif"),
                width: 150.0,
                height: 85.0,
              ),
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (input) {
                                if (input.isEmpty) {
                                  return "Provide an Email";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              onSaved: (input) => _email = input,
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 20.0, 0, 40.0),
                            child: TextFormField(
                              // ignore: missing_return
                              validator: (input) {
                                if (input.length < 6) {
                                  return "Password should be 6 char atleast";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Password',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            )),
                        Container(
                          padding: EdgeInsets.only(top: 20.0),
                          child: RaisedButton(
                            padding:
                                EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            onPressed: signin,
                            child: Text(
                              'SIGN IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 30),
                          child: GestureDetector(
                            onTap: naviagteToSignupPage,
                            child: Text(
                              'Create An Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    )))
          ],
        ),
      )),
    );
  }
}
