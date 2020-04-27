import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import './widgets/indicator.dart';
import './widgets/chart_info.dart';
import '../../../models/student.dart';
import '../../../models/flexclass.dart';
import './chart.dart';

class SOLChart extends Chart {
  final double german;
  final double english;
  final double math;
  final double total;
  final FlexClass flexClass;
  final Student student;
  final bool isStudent;
  
  SOLChart(
      {@required this.flexClass,
      this.total = 0,
      this.german = 0,
      this.english = 0,
      this.math = 0}) : student = null , isStudent = false;
  
  SOLChart.student(
      {@required this.student,
      this.total = 0,
      this.german = 0,
      this.english = 0,
      this.math = 0}) : flexClass = null, isStudent = true ;

  @override
  _SOLChartState createState() => _SOLChartState();
}

class _SOLChartState extends State<SOLChart> {
  double german;
  double english;
  double math;
  double total;
  FlexClass flexClass;
  Student student;
  bool isStudent;

  static const Color colorOne = Color(0xff0293ee);
  static const Color colorTwo = Color(0xfff8b250);
  static const Color colorThree = Color(0xff5ac18e);

  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColorLight,
      elevation: 5,
      child: Column(
        children: [
          ChartInfo(
            title: widget.flexClass.title,
            numberStudents: widget.flexClass.getMembers().length,
            numberRatings: widget.total,
          ),
          PieChart(
            PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchedIndex = -1;
                    } else {
                      touchedIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
                borderData: FlBorderData(
                  show: false,
                ),
                sectionsSpace: 0,
                centerSpaceRadius: 40,
                sections: showingSections()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Indicator(
                  color: colorOne,
                  text: 'Deutsch',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: colorTwo,
                  text: 'Englisch',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: colorThree,
                  text: 'Mathe',
                  isSquare: true,
                ),
                SizedBox(
                  height: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: colorOne,
            value: widget.german,
            title: generateTitle(widget.german),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: widget.english,
            title: generateTitle(widget.english),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff5ac18e),
            value: widget.math,
            title: generateTitle(widget.math),
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xffffffff),
            ),
          );
        default:
          return null;
      }
    });
  }

  String generateTitle(double subject) {
    if(subject == 0 || widget.total == 0) {
      return "0%";
    }
    int result = ((subject / widget.total) * 100).round();
    return "$result%";
  }
}
