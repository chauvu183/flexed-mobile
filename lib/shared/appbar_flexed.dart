import 'package:flutter/material.dart';

class AppBarFlexed extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  @override
  final Size preferredSize;

  AppBarFlexed({this.text}) : preferredSize = Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          text,
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      );
  }
}