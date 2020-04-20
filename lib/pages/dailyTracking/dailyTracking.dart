import 'package:flutter/material.dart';

import './widget/filter.dart';
import './widget/modulesDropdown.dart';
import './widget/studentProfile.dart';
import '../analyze/widgets/filterbar/filter_bar.dart';
import './widget/studentListDropdown.dart';

class DailyTracking extends StatefulWidget {
  @override
  _DailyTrackingState createState() => _DailyTrackingState();
}

class _DailyTrackingState extends State<DailyTracking> {
  bool available ;
    Widget _backgroundColors() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.grey,
        height: 250,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(  
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
           ),
           _backgroundColors(),
            //StudentListDropDown(),
            //StudentProfile(),
            //SolTracking(),
          ],
          )
      )
    );
  }
}
