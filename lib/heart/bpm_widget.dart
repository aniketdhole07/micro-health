import 'package:flutter/material.dart';

class BpmWidget extends StatelessWidget {
  final int _bpm; // beats per minute

  const BpmWidget(this._bpm);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(90, 0, 0, 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "BPM",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          Text(
            (_bpm > 30 && _bpm < 150 ? _bpm.toString() : "--"),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
