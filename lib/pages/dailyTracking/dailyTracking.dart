import 'package:flexed_mobile/pages/dailyTracking/SOLTrackingRouter/classRouter.dart';
import 'package:flexed_mobile/shared/appbar_flexed.dart';
import 'package:flexed_mobile/shared/flex_class_list/flex_class_list.dart';
import 'package:flexed_mobile/shared/infocard/class_list_info_card.dart';
import 'package:flutter/material.dart';

class DailyTracking extends StatefulWidget {
  @override
  _DailyTrackingState createState() => _DailyTrackingState();
}

class _DailyTrackingState extends State<DailyTracking> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarFlexed(text: "Ziel erfassen"),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.bottomRight,
                image: AssetImage(
                  'images/background.png',
                ),
              ),
            ),
          ),
          Column(children: <Widget>[
            ClassListInfoCard(),
            Flexible(
              child: FlexClassList(onClassSelected: this._goToClassDetails),
            ),
          ]),
        ],
      ),
    );
  }

  _goToClassDetails(_class) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ClassRouter(_class))
    ).then((value) => setState(() => {}));
  }
}
