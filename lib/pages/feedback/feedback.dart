import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/student_carousel.dart';
import 'package:flexed_mobile/shared/class_list/class_list.dart';
import 'package:flexed_mobile/shared/class_list_date_filter/date_selection.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  @override
  FeedbackState createState() => FeedbackState();
}

class FeedbackState extends State<FeedbackView> {

  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Feedback'),
      ),
      body: Column(
        children: <Widget>[
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