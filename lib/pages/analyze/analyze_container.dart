import 'package:flutter/material.dart';

import './widgets/filterbar/filter_bar.dart';
import './widgets/chartcard/pie_chart_flex.dart';

class AnalyzeContainer extends StatefulWidget {
  @override
  _AnalyzeContainerState createState() => _AnalyzeContainerState();
}

class _AnalyzeContainerState extends State<AnalyzeContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Column(children: [
        FilterBar(),
        PieChartFlex(),
      ]),
    );
  }
}
