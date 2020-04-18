import 'package:flutter/material.dart';

import 'analyze_container.dart';

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
      body: AnalyzeContainer(),
    );
  }
}
