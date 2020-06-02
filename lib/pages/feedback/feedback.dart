import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/student_carousel.dart';
import 'package:flexed_mobile/shared/flex_class_list/flex_class_list.dart';
import 'package:flexed_mobile/shared/flex_class_list_date_filter/date_selection.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  @override
  FeedbackState createState() => FeedbackState();
}

class FeedbackState extends State<FeedbackView> {

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var canvasSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title : Text('Feedback'),
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
                      height: canvasSize.height * 0.20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFFFFBB28),
                        image: DecorationImage(
                          alignment: Alignment(-0.9, 0.2),
                          image: AssetImage('images/girlForPageClasses.png'),
                        ),        
                      ),        
                    ),
                  ), 

                  Positioned(
                    bottom: canvasSize.height * 0.065,
                    left: canvasSize.width * 0.5,
                    child: Text("Klasse",
                        style: Theme.of(context).textTheme.headline6.copyWith(fontWeight: FontWeight.w800,fontSize: 53),
                        textAlign: TextAlign.left,),
                  ),
                ],
              ),
              DateSelection(
                initialDate: _selectedDate,
                onDateChanged: _onDateChanged,
              ),
              Flexible(
                child: FlexClassList(
                  onClassSelected: this._goToClassDetails,
                  dateFilterFactory: () => _selectedDate,
                )
              ),
            ],
          ),
        ],
      ),
    );
  }

  _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  _goToClassDetails(_class) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
        return StudentCarousel(flexClass: _class, selectedDate: _selectedDate,);
      })
    ).then((value) => setState(() => {}));
  }
}