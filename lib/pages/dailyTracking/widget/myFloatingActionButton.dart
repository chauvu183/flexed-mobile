import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bottomSheetWidget.dart';

class MyFloatingActionButton extends StatefulWidget {
  SOLTrack tracking;
  MyFloatingActionButton({Key key,this.tracking});
  @override
  _MyFloatingActionButtonState createState(){
    return _MyFloatingActionButtonState(this.tracking);
  }
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  SOLTrack _tracking;
  bool showFab = true;
  _MyFloatingActionButtonState(SOLTrack tracking){
    _tracking = tracking;
  }
  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
            onPressed: () {
               var bottomSheetController = showBottomSheet(
                  context: context,
                  builder: (context) => Container(
                        height: 500,
                        child: BottomSheetWidget(tracking: _tracking),
                      ));
                      showFoatingActionButton(false);
                      bottomSheetController.closed.then((value) {
                      showFoatingActionButton(true);
                      });
            },
          )
        : Container();
  }
  void showFoatingActionButton(bool value) {
    setState(() {
      showFab = value;
    });
  }
}