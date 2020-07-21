import 'package:flutter/material.dart';

class TestingUnitsWidget extends StatelessWidget {
  TestingUnitsWidget({
    @required this.title,
    @required this.unit,
    @required this.digit,
    @required this.iconData,
    @required this.iconColor,
  });

  final IconData iconData;
  final Color iconColor;
  final String title;
  final String digit;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 2),
              child: Icon(
                iconData,
                color: iconColor,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20.0),
            ),
          ],
        ),
        Row(
          // todo align text to baseline
          textBaseline: TextBaseline.alphabetic,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Text(
                digit,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            // todo align text to bottom of the line
            Text(
              unit,
              style: TextStyle(
                fontSize: 15,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
