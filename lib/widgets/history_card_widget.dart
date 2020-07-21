import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/services/theme_manager.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    Key key,
    @required this.time,
    @required this.network,
    @required this.ping,
    @required this.download,
    @required this.upload,
    @required this.ip,
    @required this.location,
  }) : super(key: key);

  final String time;
  final IconData network;
  final int ping;
  final double download;
  final double upload;
  final String ip;
  final String location;

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black54 : Colors.white54;
    return Card(
      elevation: 3,
      color: Theme.of(context).primaryColorLight,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                color: themedColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    network,
                    color: themedColor,
                    size: 40,
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.arrowAltCircleDown,
                        color: Colors.green.shade700,
                      ),
                      Text(
                        ' $download',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.arrowAltCircleUp,
                        color: Colors.orange.shade700,
                      ),
                      Text(
                        ' $upload',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.sync,
                        color: Colors.red.shade500,
                      ),
                      Text(
                        '$ping',
                        style: TextStyle(
                          fontSize: 30,
                          color: themedColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.router,
                      size: 15,
                      color: themedColor,
                    ),
                    Text(
                      ' $ip',
                      style: TextStyle(
                        color: themedColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      size: 15,
                      color: themedColor,
                    ),
                    Text(
                      '$location',
                      style: TextStyle(
                        color: themedColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
