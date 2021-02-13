import 'package:flutter/material.dart';
import './chart.dart';
import './sensorValue.dart';

class ChartViewWidget extends StatelessWidget {
  final List<SensorValue> _data; // array to store the values

  ChartViewWidget(this._data);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
          color: Colors.black),
      child: Chart(_data),
    );
  }
}
