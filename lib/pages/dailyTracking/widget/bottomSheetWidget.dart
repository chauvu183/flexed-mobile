import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'moduleSelection.dart';

class BottomSheetWidget extends StatefulWidget {
  final SOLTrack tracking;
  BottomSheetWidget({Key key ,this.tracking});
  @override
  _BottomSheetWidgetState createState() {
     return _BottomSheetWidgetState(this.tracking);
  }
}
class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  SOLTrack _tracking;
  _BottomSheetWidgetState(SOLTrack tracking){
    _tracking = tracking;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 125,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
              blurRadius: 10, color: Colors.grey[300], spreadRadius: 5)
        ]),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SOLTrackingForm(tracking: _tracking),   
        ]
      ),
    );
  }
}