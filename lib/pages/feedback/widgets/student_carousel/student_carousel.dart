import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/page_indicator.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class StudentCarousel extends StatefulWidget {

  final FlexClass flexClass;
  final DateTime selectedDate;

  StudentCarousel({ @required this.flexClass, @required this.selectedDate });

  _StudentCarouselState createState() {
    return _StudentCarouselState(flexClass: flexClass, date: selectedDate);
  }
}


class _StudentCarouselState extends State<StudentCarousel> {

  /// Contains the date of SOLtrackings to display
  final DateTime date;

  /// The class that is currently displayed
  final FlexClass flexClass;

  /// The students of the class.
  List<Student> _students;

  int _activePage = 0;
  final PageController controller = PageController(initialPage: 0);

  _StudentCarouselState({ @required this.flexClass, @required this.date }) {
    _students = flexClass.getMembers();
  }

  /// Builds a StudentPage widget for each student of the active flex class
  _buildPages() {
    List<Widget> pages = List();

    _students.forEach((student) { 
      pages.add(StudentPage(student: student, filteredDate: date,));
    });

    return pages;
  }

  _refreshPageIndicator(int page) {
    setState(() {
      _activePage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(flexClass.title, style: TextStyle(fontSize: 18.0),),
            Text(DateFormat('dd.MM.yyyy').format(date), style: TextStyle(fontSize: 13.0),)
          ]
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView(
                onPageChanged: (page) { _refreshPageIndicator(page); },
                controller: controller,
                children: _buildPages(),
              ),
            ),
            Container(
              height: 50,
              child: PageIndicator(_students.length, _activePage)
            )
          ],
        ),
      ),
    );
  }

}