import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/page_indicator.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/student_page.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
class StudentCarousel extends StatefulWidget {

  final FlexClass flexClass;

  StudentCarousel(this.flexClass);

  _StudentCarouselState createState() {
    return _StudentCarouselState(flexClass);
  }
}


class _StudentCarouselState extends State<StudentCarousel> {

  FlexClass flexClass;
  List<Student> _students;

  int _activePage = 0;
  final PageController controller = PageController(initialPage: 0);

  _StudentCarouselState(this.flexClass) {
    _students = flexClass.getMembers();
  }

  _buildPages() {
    List<Widget> pages = List();

    _students.forEach((student) { 
      pages.add(StudentPage(student));
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
        title : Text(flexClass.title),
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