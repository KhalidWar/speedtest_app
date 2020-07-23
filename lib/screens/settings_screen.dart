import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:speedtest/providers/theme_manager.dart';
import 'package:speedtest/widgets/app_header.dart';
import 'package:speedtest/widgets/settings_confirmation_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  final url = 'https://github.com/KhalidWar/speedtest';

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
                            return SettingsConfirmationDialog();
                          });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'About App',
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      OutlineButton(
                        child: Icon(FontAwesomeIcons.github),
                        highlightedBorderColor: Theme.of(context).accentColor,
                        borderSide:
                            BorderSide(color: Theme.of(context).accentColor),
                        onPressed: () async {
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Visit github repo for more information.',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
