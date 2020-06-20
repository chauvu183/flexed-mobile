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

  // ABSTRACT METHOD TO DECLARE THE CHILDREN
  // WHICH ARE INSERTED IN THE COLUMN
  List<Widget> declareChildren();
}
