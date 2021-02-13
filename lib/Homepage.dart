import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseUser user;
  bool isSignedIn = false;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) async {
      if (user == null) {
        Navigator.pushReplacementNamed(context, "/SigninPage");
      }
    });
  }

  openHeart() async {
    Navigator.pushReplacementNamed(context, "/heart");
  }

  getUser() async {
    FirebaseUser fUser = await _auth.currentUser();
    await fUser?.reload();
    fUser = await _auth.currentUser();

    if (fUser != null) {
      setState(() {
        this.user = fUser;
        this.isSignedIn = true;
      });
    }
    print(this.user);
  }

  signOut() async {
    _auth.signOut();
  }

  _launchURL() async {
    String url = "https://avr-iot.com/avr-iot/gcp/" + this.user.displayName;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(
        child: Center(
          child: !isSignedIn
              ? CircularProgressIndicator()
              : Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 50.0, 10.0, 50.0),
                      child: Image(
                        image: AssetImage('images/logo.gif'),
                        width: 170.0,
                        height: 100.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(50.0),
                      child: Text(
                        "Hello ${user.displayName}",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: _launchURL,
                        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                        child: Text(
                          "View Sensor Data",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.0),
                      child: RaisedButton(
                        color: Colors.green,
                        onPressed: () {
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text("Alert Dialog Box"),
                              content: Text(
                                  "Turn On the Flash Light and Keep your Index Finger on Camera"),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: openHeart,
                                  child: Text("Continue"),
                                ),
                              ],
                            ),
                          );
                        },
                        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                        child: Text(
                          "View Heart BPM",
                          style: TextStyle(fontSize: 20.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 35.0),
                      child: RaisedButton(
                        color: Colors.red,
                        onPressed: signOut,
                        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                        child: Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
