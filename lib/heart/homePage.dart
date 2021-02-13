import 'package:flutter/material.dart';
import './heart_monitor.dart';

class HeartPage extends StatefulWidget {
  @override
  HomePageView createState() {
    return HomePageView();
  }
}

class HomePageView extends State<HeartPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ,
      body: Center(
        child: HeartMonitor(),
      ),
    );
  }
}
