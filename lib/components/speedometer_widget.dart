import 'package:flutter/material.dart';
import 'package:flutter_speedometer/flutter_speedometer.dart';

class SpeedometerWidget extends StatelessWidget {
//  SpeedometerWidget({});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.0),
      ),
      child: Speedometer(
        size: 200,
        minValue: 0,
        maxValue: 100,
        currentValue: 0,
        warningValue: 80,
        displayText: 'Mbps',
        backgroundColor: Colors.transparent,
        kimColor: Colors.transparent,
        meterColor: Colors.green.shade600,
        displayNumericStyle: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
        ),
        displayTextStyle: TextStyle(fontSize: 5.0),
      ),
    );
  }
}
