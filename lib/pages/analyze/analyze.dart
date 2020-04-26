import 'package:flexed_mobile/pages/analyze/widgets/chartcard/pie_chart_flex.dart';
import 'package:flexed_mobile/pages/analyze/widgets/chartcard/widgets/chart_info.dart';
import 'package:flutter/material.dart';


class Analyze extends StatefulWidget {
  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  static List<String> studentsF8 = [
    'Anton Artig',
    'Berta Böse',
    'Carmen Cool',
  ];
  static List<String> studentsF9 = [
    'Detlef Diesig',
    'Emilia Eifrig',
    'Frederick Fuchsig'
  ];
  static List<String> studentsF9plus = [
    'Günther Geizig',
    'Harald Handzahm',
    'Ina Intensiv'
  ];

  static Map<String, List<String>> classes = {
    'F8': studentsF8,
    'F9': studentsF9,
    'F9+': studentsF9plus,
  };

  String selectedClass;
  String selectedStudent;

  @override
  Widget build(BuildContext context) {
   
    if(selectedClass == null) {
       selectedClass = 'F8';
    }
    if(selectedStudent == null) {
       selectedStudent = classes[selectedClass][0];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Analyse"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: selectedClass,
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
                  onChanged: (String newSelectedClass) {
                    setState(() {
                      selectedClass = newSelectedClass;
                      selectedStudent = classes[selectedClass][0];
                    });
                  },
                  items:
                      classes.keys.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                VerticalDivider(),
                DropdownButton<String>(
                  value: selectedStudent,
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
                  onChanged: (String newStudent) {
                    setState(() {
                      selectedStudent = newStudent;                    
                    });
                  },
                  items:
                      classes[selectedClass].map<DropdownMenuItem<String>>((String student) {
                    return DropdownMenuItem<String>(
                      value: student,
                      child: Text(student),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                ChartInfo(title: selectedClass,numberStudents: classes[selectedClass].length,numberRatings: 20,),
                PieChartFlex(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
