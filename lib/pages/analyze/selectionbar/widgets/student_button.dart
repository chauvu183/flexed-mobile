import 'package:flutter/material.dart';

import '../../../../models/flexclass.dart';
import '../../../../models/student.dart';

// the dropdown button for the students
class StudentButton<Student> extends StatefulWidget {
  final Color btnColor = Color(0xFF14BD9C);
  final Function(Student) callBackSelectedStudent;
  final FlexClass selectedClass;
  final Student selectedStudent;

  StudentButton({
    this.callBackSelectedStudent,
    this.selectedClass,
    this.selectedStudent,
  });

  @override
  _StudentButtonState createState() => _StudentButtonState();
}

class _StudentButtonState extends State<StudentButton> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,2,10,2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.btnColor,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: DropdownButton<Student>(
        value: widget.selectedStudent,
        hint: Text("Schüler"),
        icon: Icon(
          Icons.arrow_drop_down,
          color: widget.btnColor,
        ),
        iconSize: 28,
        isDense: true,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        onChanged: (Student newStudent) {
          setState(() {
            widget.callBackSelectedStudent(newStudent);
          });
        },
        items: widget.selectedClass == null
            ? []
            : widget.selectedClass
                .getMembers()
                .map<DropdownMenuItem<Student>>((student) {
                return DropdownMenuItem<Student>(
                  value: student,
                  child: Text(student.getFullName()),
                );
              }).toList(),
      ),
    );
  }
}
