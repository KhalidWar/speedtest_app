import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:speedtest/dummy_data/history_list_item.dart';
import 'package:speedtest/providers/theme_manager.dart';
import 'package:speedtest/widgets/extra_info_widget.dart';
import 'package:speedtest/widgets/radial_gauge.dart';

import 'dialog_share_close_button.dart';

class HistoryDetailDialog extends StatelessWidget {
  const HistoryDetailDialog({
    Key key,
    this.time,
    this.networkType,
    this.ping,
    this.download,
    this.upload,
    this.ip,
    this.location,
    this.index,
  }) : super(key: key);
  final String time, ip, location;
  final IconData networkType;
  final int ping, index;
  final double download, upload;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 100),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            style: BorderStyle.solid,
            color: Theme.of(context).accentColor,
          )),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                UploadPingWidget(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  size: size,
                  textTheme: textTheme,
                  themedColor: themedColor,
                  ping: upload,
                  iconData: FontAwesomeIcons.arrowAltCircleUp,
                  iconColor: Colors.orange.shade700,
                  label: ' Upload',
                  unit: 'Mbps',
                ),
                UploadPingWidget(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  size: size,
                  textTheme: textTheme,
                  themedColor: themedColor,
                  ping: ping.toDouble(),
                  iconData: Icons.sync,
                  iconColor: Colors.red.shade500,
                  label: ' Ping',
                  unit: 'ms',
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Expanded(
              child: Container(
                width: size.width * 0.7,
                child: Stack(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              FontAwesomeIcons.arrowAltCircleDown,
                              size: size.height * 0.025,
                              color: Colors.green.shade700,
                            ),
                            Text(
                              ' Download',
                              style: textTheme.headline6.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '$download',
                              style: textTheme.headline3.copyWith(
                                color: themedColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Mbps',
                              style: textTheme.bodyText2,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height * 0.1,
                      width: size.width * 0.7,
                      child: RadialGauge(
                        showAnnotation: false,
                        value: download,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ExtraInfoWidget(
                  iconData: Icons.wifi,
                  title: 'Wifi',
                  subtitle: '${historyItemList[index].wifiName}',
                ),
                ExtraInfoWidget(
                  iconData: Icons.router,
                  title: 'IP Address',
                  subtitle: '$ip',
                ),
              ],
            ),
            SizedBox(height: size.height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ExtraInfoWidget(
                  iconData: Icons.location_on,
                  title: 'Location',
                  subtitle: '$location',
                ),
                ExtraInfoWidget(
                  iconData: Icons.schedule,
                  title: 'Time',
                  subtitle: '$time',
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DialogShareCloseButton(
                    size: size,
                    label: 'Share',
                    iconData: Icons.share,
                    onPress: () {}),
                DialogShareCloseButton(
                  size: size,
                  label: 'Close',
                  iconData: Icons.close,
                  onPress: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UploadPingWidget extends StatelessWidget {
  const UploadPingWidget({
    Key key,
    @required this.themedColor,
    @required this.ping,
    this.label,
    this.unit,
    this.iconData,
    this.iconColor,
    this.textTheme,
    this.crossAxisAlignment,
    this.size,
  }) : super(key: key);

  final CrossAxisAlignment crossAxisAlignment;
  final TextTheme textTheme;
  final Color themedColor;
  final Size size;
  final double ping;
  final String label, unit;
  final IconData iconData;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              iconData,
              size: size.height * 0.025,
              color: Colors.red.shade500,
            ),
            Text(
              '$label',
              style: textTheme.headline6
                  .copyWith(color: themedColor, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text(
              '$ping',
              style: textTheme.headline4
                  .copyWith(color: themedColor, fontWeight: FontWeight.bold),
            ),
            Text(
              '$unit',
              style: textTheme.headline6
                  .copyWith(fontWeight: FontWeight.w400, color: themedColor),
            ),
          ],
        ),
      ],
    );
  }
}
