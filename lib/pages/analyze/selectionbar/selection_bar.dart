import 'package:flutter/material.dart';

import '../../../models/flexclass.dart';
import '../../../models/student.dart';

class SelectionBar extends StatefulWidget {
  final List<FlexClass> createdClasses;
  final FlexClass selectedClass;
  final Student selectedStudent;
  final String analyzeType;

  final Function(FlexClass) callBackSelectedClass;
  final Function(Student) callBackSelectedStudent;
  final Function(String) callBackSelectedAnalyzeType;

  SelectionBar({this.createdClasses, this.selectedClass, this.selectedStudent,
      this.analyzeType, this.callBackSelectedClass, this.callBackSelectedStudent, this.callBackSelectedAnalyzeType});

  @override
  _SelectionBarState createState() => _SelectionBarState();
}

class _SelectionBarState extends State<SelectionBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              DropdownButton<FlexClass>(
                value: widget.selectedClass ?? null,
                hint: Text("Klasse"),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).accentColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).accentColor,
                ),
                onChanged: (FlexClass newSelectedClass) {
                  setState(() {
                    widget.callBackSelectedClass(newSelectedClass);
                    widget.callBackSelectedStudent(null);
                  });
                },
                items: widget.createdClasses
                    .map<DropdownMenuItem<FlexClass>>((FlexClass value) {
                  return DropdownMenuItem<FlexClass>(
                    value: value,
                    child: Text(value.title),
                  );
                }).toList(),
              ),
              VerticalDivider(),
              DropdownButton<Student>(
                value: widget.selectedStudent,
                hint: Text("Schüler"),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).accentColor,
                ),
                iconSize: 24,
                style: TextStyle(color: Theme.of(context).primaryColorDark),
                underline: Container(
                  height: 2,
                  color: Theme.of(context).accentColor,
                ),
                onChanged: (Student newStudent) {
                  setState(() {
                    widget.callBackSelectedStudent(newStudent);
                  });
                },
                items: widget.selectedClass == null
                    ? []
                    : widget.selectedClass
                        .getMembers()
                        .map<DropdownMenuItem<Student>>((Student student) {
                        return DropdownMenuItem<Student>(
                          value: student,
                          child: Text(student.getFullName()),
                        );
                      }).toList(),
              ),
            ],
          ),
          DropdownButton<String>(
            value: widget.analyzeType,
            hint: Text("Auswertung"),
            icon: Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).accentColor,
            ),
            iconSize: 24,
            style: TextStyle(color: Theme.of(context).primaryColorDark),
            underline: Container(
              height: 2,
              color: Theme.of(context).accentColor,
            ),
            onChanged: (String newType) {
              setState(() {
                widget.callBackSelectedAnalyzeType(newType);
              });
            },
            items: [
              DropdownMenuItem<String>(
                value: 'Fach',
                child: Text('Fach'),
              ),
              DropdownMenuItem<String>(
                value: 'Bewertung',
                child: Text('Bewertung'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
