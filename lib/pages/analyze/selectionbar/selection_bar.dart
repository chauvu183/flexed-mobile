import 'package:flexed_mobile/pages/analyze/selectionbar/widgets/analyze_type_button.dart';
import 'package:flexed_mobile/pages/analyze/selectionbar/widgets/flexclass_button.dart';
import 'package:flutter/material.dart';

import '../../../models/flexclass.dart';
import '../../../models/student.dart';
import 'widgets/student_button.dart';

class SelectionBar extends StatefulWidget {
  final List<FlexClass> createdClasses;
  final FlexClass selectedClass;
  final Student selectedStudent;
  final String analyzeType;

  final Function(FlexClass) callBackSelectedClass;
  final Function(Student) callBackSelectedStudent;
  final Function(String) callBackSelectedAnalyzeType;

  SelectionBar({
    this.createdClasses,
    this.selectedClass,
    this.selectedStudent,
    this.analyzeType,
    this.callBackSelectedClass,
    this.callBackSelectedStudent,
    this.callBackSelectedAnalyzeType,
  });

  @override
  _SelectionBarState createState() => _SelectionBarState();
}

// the selection bar includes the three dropdown buttons for each category
class _SelectionBarState extends State<SelectionBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              FlexClassButton(
                callBackSelectedClass: widget.callBackSelectedClass,
                callBackSelectedStudent: widget.callBackSelectedStudent,
                selected: widget.selectedClass,
                createdClasses: widget.createdClasses,
              ),
              VerticalDivider(),
              Expanded(
                child: AnalyzeTypeButton(
                  analyzeType: widget.analyzeType,
                  callBackSelectedAnalyzeType: widget.callBackSelectedAnalyzeType,
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StudentButton(
                  selectedClass: widget.selectedClass,
                  callBackSelectedStudent: widget.callBackSelectedStudent,
                  selectedStudent: widget.selectedStudent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
