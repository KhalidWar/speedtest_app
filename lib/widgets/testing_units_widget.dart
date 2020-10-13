import 'package:flutter/material.dart';
import 'package:speedtest/providers/theme_manager.dart';

class TestingUnitsWidget extends StatelessWidget {
  const TestingUnitsWidget({
    @required this.title,
    @required this.unit,
    @required this.digit,
    @required this.iconData,
    @required this.iconColor,
    this.isDownload,
    this.crossAxisAlignment,
  });

  final CrossAxisAlignment crossAxisAlignment;
  final IconData iconData;
  final Color iconColor;
  final String title;
  final String digit;
  final String unit;
  final bool isDownload;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              ' $title',
              style: textTheme.headline6.copyWith(
                fontSize: isDownload ? 30 : 15,
                fontWeight: isDownload ? FontWeight.bold : FontWeight.w400,
              ),
            ),
          ],
        ),
        Row(
          // todo align text to baseline
          children: <Widget>[
            Text(
              digit,
              style: isDownload
                  ? textTheme.headline3.copyWith(
                      fontWeight: FontWeight.bold,
                      color: themedColor,
                    )
                  : textTheme.headline4.copyWith(color: themedColor),
            ),
            // todo align text to bottom of the line
            Text(
              unit,
              style: textTheme.bodyText2,
            ),
          ],
        ),
      ],
    );
  }
}
