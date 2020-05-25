import 'package:flexed_mobile/pages/dailyTracking/SOLTrackingRouter/classRouter.dart';
import 'package:flexed_mobile/shared/flex_class_list/flex_class_list.dart';
import 'package:flutter/material.dart';


class DailyTracking extends StatefulWidget {
  @override
  _DailyTrackingState createState() => _DailyTrackingState();
}

class _DailyTrackingState extends State<DailyTracking> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ziel Erfassen",
        style: TextStyle(fontSize: 25
        ),),
        centerTitle: true,
        
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
            image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(
                   'images/background-03-02.png',
                 ),
                ),        
           ),
          ),
          Column(
            children: <Widget>[
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: size.height * 0.20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Color(0xFFFFFBB28),
                          image: DecorationImage(
                            alignment: Alignment(-0.9, 0.2),
                            image: AssetImage(
                          'images/girlForPageClasses.png',
                          )
                          ),        
                        ),        
                      ),
                    ),             
                    Positioned(
                      bottom: size.height * 0.065,
                      left: size.width *0.5,
                      child: Text("Klasse",
                          style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w800,fontSize: 53),
                          textAlign: TextAlign.left,),
                    ),
                  ],
                ),
                Flexible(
                  child: FlexClassList(onClassSelected: this._goToClassDetails),
                ),
          ]
          ),
        ],
      ),
    );
  }

  _goToClassDetails(_class) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ClassRouter(_class)));
  }
}
