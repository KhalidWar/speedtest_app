import 'package:flutter/material.dart';

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
    return Row(
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
    );
  }
}
