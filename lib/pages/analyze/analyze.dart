import 'package:flutter/material.dart';

import 'widgets/filterbar/filter_bar.dart';
import 'widgets/chartcard/pie_chart_flex.dart';

class Analyze extends StatefulWidget {
  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Analyse'),
      ),
      body: Column(children: [
        FilterBar(),
        PieChartFlex(),
      ]),
    );
  }
}
