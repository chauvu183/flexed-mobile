import 'package:flutter/material.dart';

import '../../../../models/flexclass.dart';
import '../../../../models/student.dart';

// the dropdown button for the flex classes
class FlexClassButton<FlexClass> extends StatefulWidget {
  final Color btnColor = Color(0xFF14BD9C);
  final Function(FlexClass) callBackSelectedClass;
  final Function(Student) callBackSelectedStudent;
  final List<FlexClass> createdClasses;
  final FlexClass selected;

  FlexClassButton({
    this.callBackSelectedClass,
    this.callBackSelectedStudent,
    this.selected,
    this.createdClasses,
  });

  @override
  _FlexClassButtonState createState() => _FlexClassButtonState();
}

class _FlexClassButtonState extends State<FlexClassButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.btnColor,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: DropdownButton<FlexClass>(
        value: widget.selected ?? null,
        hint: Text("Klasse"),
        icon: Icon(
          Icons.arrow_drop_down,
          color: widget.btnColor,
        ),
        iconSize: 28,
        underline: SizedBox(),
        isDense: true,
        isExpanded: false,
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        onChanged: (FlexClass newSelectedClass) {
          setState(() {
            // selected = newSelectedClass;
            widget.callBackSelectedClass(newSelectedClass);
            widget.callBackSelectedStudent(null);
          });
        },
        items: widget.createdClasses.map<DropdownMenuItem<FlexClass>>((value) {
          return DropdownMenuItem<FlexClass>(
            value: value,
            child: Text(value.title),
          );
        }).toList(),
      ),
    );
  }
}
