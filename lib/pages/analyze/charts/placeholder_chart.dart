import 'package:flutter/material.dart';

import '../charts/ichart.dart';

class PlaceholderChart extends IChart {
  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.assessment,
                size: 160,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2),
              child: Text('Wähle eine Klasse',
                  style: Theme.of(context).textTheme.headline6),
            ),
          ],
    );
  }
}
