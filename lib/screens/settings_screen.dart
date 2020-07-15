import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:speedtest/components/about_content.dart';
import 'package:speedtest/components/app_header.dart';
import 'package:speedtest/dummy_data/history_list_item.dart';
import 'package:speedtest/services/theme_manager.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AppHeader(),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Dark Theme',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Consumer<ThemeManager>(
                    builder: (context, themeManager, child) => Switch(
                      value: themeManager.isDark,
                      onChanged: (toggle) {
                        themeManager.toggleTheme();
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'History',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  OutlineButton(
                    child: Text('Clear History'),
                    highlightedBorderColor: Theme.of(context).accentColor,
                    borderSide:
                        BorderSide(color: Theme.of(context).accentColor),
                    onPressed: () {
                      showModal(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmationDialog();
                          });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'About App',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                aboutContent(),
                style: TextStyle(letterSpacing: 1),
              ),
              IconButton(
                iconSize: 50,
                icon: Icon(FontAwesomeIcons.github),
                onPressed: () {
                  // todo add project public github repo
                },
              ),
              Text(
                'License',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: RichText(
        text: TextSpan(
            text: 'Are you sure you want to ',
            style: TextStyle(
              fontSize: 20,
              color: isLightTheme(context) ? Colors.black : Colors.white,
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
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
          ),
          onPressed: () {
            historyItemList.clear();
            Navigator.pop(context);
          },
        ),
        OutlineButton(
          highlightedBorderColor: Theme.of(context).accentColor,
          borderSide: BorderSide(color: Theme.of(context).accentColor),
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'No',
            style:
                TextStyle(fontSize: 20, color: Theme.of(context).accentColor),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
