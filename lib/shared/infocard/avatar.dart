import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  final String initials;

  Avatar({this.initials});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundColor: Theme.of(context).primaryColorDark,
      child: Text(initials, style: TextStyle(fontSize: 25, fontStyle: FontStyle.normal, color: Colors.white),)
    );
  }
}