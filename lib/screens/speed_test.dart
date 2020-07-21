import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/widgets/app_header.dart';
import 'package:speedtest/widgets/extra_info_widget.dart';
import 'package:speedtest/widgets/radial_gauge.dart';
import 'package:speedtest/widgets/testing_units_widget.dart';

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
                  TestingUnitsWidget(
                    iconData: FontAwesomeIcons.arrowAltCircleUp,
                    iconColor: Colors.orange.shade700,
                    digit: '0',
                    title: 'Upload',
                    unit: 'Mbps',
                  ),
                  TestingUnitsWidget(
                    iconData: FontAwesomeIcons.arrowAltCircleDown,
                    iconColor: Colors.green.shade700,
                    digit: '0',
                    title: 'Download',
                    unit: 'Mbps',
                  ),
                  TestingUnitsWidget(
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
