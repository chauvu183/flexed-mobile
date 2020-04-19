import 'package:flutter/material.dart';

class DropdownEntry extends StatelessWidget {
  final String text;
  final double dropDownFontSize = 16.0;
  DropdownEntry({this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: dropDownFontSize,
          ),
        ),
        Divider(color: Theme.of(context).primaryColorDark,),
      ],
    );
  }
}
