
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './studentSOLTrackingPage.dart';


class ClassRouter extends StatefulWidget {
  final FlexClass flexClass;

  const ClassRouter(this.flexClass);

  @override
  _ClassRouterState createState() => _ClassRouterState(flexClass);
}

class _ClassRouterState extends State<ClassRouter> {
  FlexClass flexClass;
  List<Student> students;
  int activePage = 0;
  final PageController controller = PageController(initialPage: 0);

  _ClassRouterState(this.flexClass){
    students = flexClass.getMembers();
  }


buildPages(){
  List<Widget> pages = List();

  students.forEach((element) {
    pages.add(StudentSOLPage(element));
  });

  return pages;
}

refreshPageIndicator(int page) {
    setState(() {
      activePage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
     return Scaffold(
      appBar: AppBar(
        title : Text(flexClass.title,
        style: TextStyle(
          fontSize: 25,
          color: Theme.of(context).primaryColorLight),),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              child: PageView(
                onPageChanged: (page) { refreshPageIndicator(page); },
                controller: controller,
                children: buildPages(),
              ),
            ),
            Container(
              height: 50,
              child: PageIndicator(students.length, activePage)
            )
          ],
        ),
      ),
    );
  }
}
