import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _name, _email, _password;

  checkauthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  navigatetosigninScreen() {
    Navigator.pushReplacementNamed(context, "/SigninPage");
  }

  @override
  void initState() {
    super.initState();
    this.checkauthentication();
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

  signup() async {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      try {
        FirebaseUser user = await _auth.createUserWithEmailAndPassword(
            email: _email.trim(), password: _password);
        if (user != null) {
          UserUpdateInfo updateuser = UserUpdateInfo();
          updateuser.displayName = _name;
          user.updateProfile(updateuser);
          debugPrint(_name);
        }
      } catch (e) {
        showError(e.message);
      }
    }
  }
  // signup() async {
  //   if (_key.currentState.validate()) {
  //     _key.currentState.save();
  //     try {
  //       UserCredential user = await _auth.createUserWithEmailAndPassword(
  //           email: _email, password: _password);
  //       if (user != null) {
  //         _auth.authStateChanges().listen((event) {
  //           event.updateProfile(displayName: _name);
  //         });
  //       }
  //     } catch (e) {
  //       showError(e.message);
  //     }
  //   }
  // }

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
                                  return "Enter AVR-IoT WG Board ID";
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'Enter AVR-IoT WG Board ID',
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                              onSaved: (input) => _name = input,
                            )),
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
                            onPressed: signup,
                            child: Text(
                              'SIGN UP',
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
                            onTap: navigatetosigninScreen,
                            child: Text(
                              'Go To Sign In Page',
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
