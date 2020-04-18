import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentCarousel extends StatefulWidget {

  final FlexClass flexClass;

  StudentCarousel(this.flexClass);

  ActiveStudent createState() {
    return ActiveStudent(flexClass);
  }
}


class ActiveStudent extends State<StudentCarousel> {

  FlexClass flexClass;
  Student activeStudent;

  ActiveStudent(this.flexClass) {
    activeStudent = flexClass.getMembers().first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(flexClass.title),
      ),
      body: Card(
        child: InfoCard(student: activeStudent,),
      ),
    );
  }
}