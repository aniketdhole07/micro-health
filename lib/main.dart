import 'package:flutter/material.dart';
import 'SigninPage.dart';
import 'SignupPage.dart';
import 'Homepage.dart';
import 'heart/homePage.dart';
import 'package:provider/provider.dart';
import 'heart/circulat_animation_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CircularAnimationProvider>.value(
          value: CircularAnimationProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'FIREBASE LOGIN',
          theme: ThemeData.dark(),
          home: Homepage(),
          routes: <String, WidgetBuilder>{
            "/SigninPage": (BuildContext context) => SigninPage(),
            "/SignupPage": (BuildContext context) => SignupPage(),
            "/heart": (BuildContext context) => HeartPage(),
          }),
    );
  }
}
