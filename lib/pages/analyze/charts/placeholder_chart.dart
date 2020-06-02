import 'package:flutter/material.dart';

import '../charts/ichart.dart';

class PlaceholderChart extends IChart {
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: EdgeInsets.all(2),
              child: Icon(
                Icons.assessment,
                size: 160,
                color: Color(0xFF14BD9C),
              ),
    );
  }
}
