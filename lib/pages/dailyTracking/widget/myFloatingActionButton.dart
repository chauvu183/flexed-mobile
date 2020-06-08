import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bottomSheetWidget.dart';

class MyFloatingActionButton extends StatefulWidget {
  Student student;
  MyFloatingActionButton({Key key,this.student});
  @override
  _MyFloatingActionButtonState createState(){
    return _MyFloatingActionButtonState(this.student);
  }
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  Student _student;
  SOLTrack _tracking = new SOLTrack();

  bool showFab = true;
  _MyFloatingActionButtonState( Student student){
    _student = student;
  }
  _addTracking(){
    _tracking.student = _student;
  }
  @override
  Widget build(BuildContext context) {
    return showFab
        ? FloatingActionButton(
            onPressed: () {
              _tracking.student = _student;
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