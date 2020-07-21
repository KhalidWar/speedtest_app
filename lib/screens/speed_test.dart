import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/components/app_header.dart';
import 'package:speedtest/components/radial_gauge.dart';

class SpeedTest extends StatefulWidget {
  @override
  _SpeedTestState createState() => _SpeedTestState();
}

class _SpeedTestState extends State<SpeedTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: <Widget>[
              AppHeader(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  TestingUnits(
                    iconData: FontAwesomeIcons.arrowAltCircleUp,
                    iconColor: Colors.orange.shade700,
                    digit: '0',
                    title: 'Upload',
                    unit: 'Mbps',
                  ),
                  TestingUnits(
                    iconData: FontAwesomeIcons.arrowAltCircleDown,
                    iconColor: Colors.green.shade700,
                    digit: '0',
                    title: 'Download',
                    unit: 'Mbps',
                  ),
                  TestingUnits(
                    iconData: Icons.sync,
                    iconColor: Colors.red,
                    digit: '0',
                    title: 'Ping',
                    unit: 'ms',
                  ),
                ],
              ),
              Expanded(
                child: RadialGauge(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ExtraInfoWidget(
                    iconData: Icons.wifi,
                    title: 'Wifi',
                    subtitle: 'Flying Cactus',
                  ),
                  ExtraInfoWidget(
                    iconData: Icons.router,
                    title: 'IP Address',
                    subtitle: '63.5.17.93',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExtraInfoWidget extends StatelessWidget {
  const ExtraInfoWidget({
    Key key,
    this.iconData,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final IconData iconData;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            iconData,
            size: 30,
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                subtitle,
                overflow: TextOverflow.clip,
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TestingUnits extends StatelessWidget {
  TestingUnits({
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
