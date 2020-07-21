import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:speedtest/dummy_data/history_list_item.dart';
import 'package:speedtest/widgets/app_header.dart';
import 'package:speedtest/widgets/history_card_widget.dart';
import 'package:speedtest/widgets/history_detail_dialog.dart';

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
                                  showModal(
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
