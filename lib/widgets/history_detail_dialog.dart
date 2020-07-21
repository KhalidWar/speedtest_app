import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/services/theme_manager.dart';

class HistoryDetailDialog extends StatelessWidget {
  const HistoryDetailDialog({
    Key key,
    this.time,
    this.network,
    this.ping,
    this.download,
    this.upload,
    this.ip,
    this.location,
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
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
      // todo use thof.cardTheme instead of this repeated code
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(style: BorderStyle.solid, color: Colors.red),
      ),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
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
          ],
        ),
      ),
    );
  }
}
