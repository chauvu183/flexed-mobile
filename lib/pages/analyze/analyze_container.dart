import 'package:flutter/material.dart';

import 'pie_chart_flex.dart';

class AnalyzeContainer extends StatefulWidget {
  @override
  _AnalyzeContainerState createState() => _AnalyzeContainerState();
}

class _AnalyzeContainerState extends State<AnalyzeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
       color: Theme.of(context).backgroundColor,
       child: PieChartFlex(),
    );
  }
}