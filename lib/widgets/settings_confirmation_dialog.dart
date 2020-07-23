import 'package:flutter/material.dart';
import 'package:speedtest/providers/theme_manager.dart';

class SettingsConfirmationDialog extends StatelessWidget {
  const SettingsConfirmationDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color themedColor = isLightTheme(context) ? Colors.black : Colors.white;
    return AlertDialog(
      content: RichText(
        text: TextSpan(
            text: 'Are you sure you want to ',
            style: TextStyle(
              fontSize: 20,
              color: themedColor,
            ),
            children: [
              TextSpan(
                text: 'Clear History ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: '?'),
            ]),
      ),
      actions: <Widget>[
        OutlineButton(
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Yes',
            style: TextStyle(fontSize: 20, color: themedColor),
          ),
          onPressed: () {
//            historyItemList.clear();
            Navigator.pop(context);
          },
        ),
        OutlineButton(
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'No',
            style: TextStyle(fontSize: 20, color: themedColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
