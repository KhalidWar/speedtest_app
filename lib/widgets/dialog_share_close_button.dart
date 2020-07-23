import 'package:flutter/material.dart';

class DialogShareCloseButton extends StatelessWidget {
  const DialogShareCloseButton({
    Key key,
    @required this.size,
    this.iconData,
    this.label,
    this.onPress,
  }) : super(key: key);

  final Size size;
  final IconData iconData;
  final String label;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.3,
      height: size.height * 0.05,
      child: OutlineButton(
        highlightedBorderColor: Theme.of(context).accentColor,
        borderSide: BorderSide(color: Theme.of(context).accentColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData),
            SizedBox(width: size.width * 0.01),
            Text(label),
          ],
        ),
        onPressed: onPress,
      ),
    );
  }
}
