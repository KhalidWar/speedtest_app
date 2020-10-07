import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:speedtest/dummy_data/history_list_item.dart';
import 'package:speedtest/widgets/history_card_widget.dart';
import 'package:speedtest/widgets/history_detail_dialog.dart';
import 'package:speedtest/widgets/radial_gauge.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return historyItemList.isEmpty
        ? historyIsEmpty()
        : ListView.builder(
            shrinkWrap: true,
            itemCount: historyItemList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 3),
                child: GestureDetector(
                  onTap: () {
                    showModal(
                      context: context,
                      builder: (BuildContext context) {
                        return HistoryDetailDialog(
                          index: index,
                          time: historyItemList[index].time,
                          networkType: historyItemList[index].networkType,
                          ping: historyItemList[index].ping,
                          download: historyItemList[index].download,
                          upload: historyItemList[index].upload,
                          ip: historyItemList[index].ip,
                          location: historyItemList[index].location,
                        );
                      },
                    );
                  },
                  child: HistoryCardWidget(
                    time: historyItemList[index].time,
                    network: historyItemList[index].networkType,
                    ping: historyItemList[index].ping,
                    download: historyItemList[index].download,
                    upload: historyItemList[index].upload,
                    ip: historyItemList[index].ip,
                    location: historyItemList[index].location,
                  ),
                ),
              );
            },
          );
  }

  Expanded historyIsEmpty() {
    Size size = MediaQuery.of(context).size;

    return Expanded(
      child: Container(
        width: size.width * 0.85,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RadialGauge(
              showAnnotation: true,
              value: 0,
            ),
            Text('History list is empty.'),
          ],
        ),
      ),
    );
  }
}
