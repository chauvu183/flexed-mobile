import 'package:flutter/material.dart';
import './widget/classList.dart';


class DailyTracking extends StatefulWidget {
  @override
  _DailyTrackingState createState() => _DailyTrackingState();
}

class _DailyTrackingState extends State<DailyTracking> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Ziel Erfassen"),
      ),
      body: ClassList(),
    );
  }
}
