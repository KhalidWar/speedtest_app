import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/components/app_header.dart';
import 'package:speedtest/components/history_list_item.dart';
import 'package:speedtest/services/theme_manager.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
          child: Column(
            children: <Widget>[
              AppHeader(),
              historyItemList.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: historyItemList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 3),
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return HistoryDetailDialog(
                                          time: historyItemList[index].time,
                                          network:
                                              historyItemList[index].network,
                                          ping: historyItemList[index].ping,
                                          download:
                                              historyItemList[index].download,
                                          upload: historyItemList[index].upload,
                                          ip: historyItemList[index].ip,
                                          location:
                                              historyItemList[index].location,
                                        );
                                      });
                                },
                                child: HistoryCardWidget(
                                  time: historyItemList[index].time,
                                  network: historyItemList[index].network,
                                  ping: historyItemList[index].ping,
                                  download: historyItemList[index].download,
                                  upload: historyItemList[index].upload,
                                  ip: historyItemList[index].ip,
                                  location: historyItemList[index].location,
                                ),
                              ),
                            );
                          }),
                    )
                  // todo empty gauge to indicate empty page
                  : Container(
                      child: Text(
                        'Empty.',
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

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
