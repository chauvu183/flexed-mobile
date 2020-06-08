import 'package:flutter/material.dart';

abstract class BarItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: declareChildren(), 
    );
  }

  List<Widget> declareChildren();
}
