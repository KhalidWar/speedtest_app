import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/dummy_data/history_list_item.dart';
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
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: <Widget>[
              AppHeader(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TestingUnitsWidget(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    iconData: FontAwesomeIcons.arrowAltCircleUp,
                    iconColor: Colors.orange.shade700,
                    digit: '${historyItemList[0].upload}',
                    title: 'Upload',
                    unit: 'Mbps',
                    isDownload: false,
                  ),
                  TestingUnitsWidget(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    iconData: FontAwesomeIcons.arrowAltCircleDown,
                    iconColor: Colors.green.shade700,
                    digit: '${historyItemList[0].download}',
                    title: 'Download',
                    unit: 'Mbps',
                    isDownload: true,
                  ),
                  TestingUnitsWidget(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    iconData: Icons.sync,
                    iconColor: Colors.red,
                    digit: '${historyItemList[0].ping}',
                    title: 'Ping',
                    unit: 'ms',
                    isDownload: false,
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  width: size.width * 0.85,
                  height: size.height,
                  child: RadialGauge(
                    value: historyItemList[0].download,
                    showAnnotation: true,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ExtraInfoWidget(
                    iconData: Icons.wifi,
                    title: 'Wifi',
                    subtitle: '${historyItemList[0].wifiName}',
                  ),
                  ExtraInfoWidget(
                    iconData: Icons.router,
                    title: 'IP Address',
                    subtitle: '${historyItemList[0].ip}',
                  ),
                  ExtraInfoWidget(
                    iconData: Icons.location_on,
                    title: 'Location',
                    subtitle: '${historyItemList[0].location}',
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
