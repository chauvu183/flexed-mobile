import 'package:flexed_mobile/pages/analyze/charts/BarChart.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_class_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_student_info.dart';
import 'package:flexed_mobile/pages/analyze/logic/soltrack_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/repository/flexclass_repository.dart';
import '../../api/repository/soltrack_repository.dart';
import '../../models/flexclass.dart';
import '../../models/soltrack.dart';
import '../../models/student.dart';

class Analyze extends StatefulWidget {
  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  FlexClassRepository _flexClassRepository;
  SOLTrackRepository _trackRepository;
  FlexClass _selectedClass;
  Student _selectedStudent;
  List<FlexClass> _createdClasses = List();
  List<SOLTrack> _trackings = List();
  BarChart _chart;

  @override
  Widget build(BuildContext context) {
    _flexClassRepository = Provider.of<FlexClassRepository>(context);
    _trackRepository = Provider.of<SOLTrackRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Analyse"),
      ),
      body: Center(
        child: _checkLoadingState(),
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedClass == null) {
      _selectedClass = _createdClasses[0];
      _refreshTrackingsByClass(_selectedClass.getMembers());
      _chart = _buildChart(SOLTrackCalculator.analyzeTrackingsBySOL(_trackings));
    } else {
      _chart = _buildChart(SOLTrackCalculator.analyzeTrackingsBySOL(_trackings));
    }

    return Padding(
      padding: const EdgeInsets.only(bottom : 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Row(
              children: [
                DropdownButton<FlexClass>(
                  value: _selectedClass ?? null,
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
                      _selectedClass = newSelectedClass;
                      _selectedStudent = null;
                      _refreshTrackingsByClass(_selectedClass.getMembers());
                      _chart = _buildChart(
                          SOLTrackCalculator.analyzeTrackingsBySOL(_trackings));
                    });
                  },
                  items: _createdClasses
                      .map<DropdownMenuItem<FlexClass>>((FlexClass value) {
                    return DropdownMenuItem<FlexClass>(
                      value: value,
                      child: Text(value.title),
                    );
                  }).toList(),
                ),
                VerticalDivider(),
                DropdownButton<Student>(
                  value: _selectedStudent,
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
                      _selectedStudent = newStudent;
                      _refreshTrackingsByStudent(_selectedStudent);
                      _chart = _buildChart(
                          SOLTrackCalculator.analyzeTrackingsBySOL(_trackings));
                    });
                  },
                  items: _selectedClass
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
          ),
          _chart,   
        ],
      ),
    );
  }

  _refreshFlexClass() async {
    await _flexClassRepository
        .index()
        .then((flexclasses) => setState(() => {_createdClasses = flexclasses}));
  }

  _refreshTrackingsByClass(List<Student> students) async {
    await _trackRepository.byStudents(students).then((trackings) => {
          _trackings = trackings,
          _chart = _buildChart(SOLTrackCalculator.analyzeTrackingsBySOL(_trackings))
        });
  }

  _refreshTrackingsByStudent(Student student) async {
    await _trackRepository
        .byStudent(student)
        .then((trackings) => {_trackings = trackings});
  }

  Widget _checkLoadingState() {
    if (_createdClasses.length == 0) {
      _refreshFlexClass();
      return CircularProgressIndicator();
    }
    if (_trackings.length == 0 && _selectedClass != null) {
      _selectedStudent == null
          ? _refreshTrackingsByClass(_selectedClass.getMembers())
          : _refreshTrackingsByStudent(_selectedStudent);
      return CircularProgressIndicator();
    }
    return _buildContent();
  }

  BarChart _buildChart(Map<String, int> trackings) {
    IChartInfo chartInfo;
    _selectedStudent == null ? 
      chartInfo = ChartClassInfo(title: _selectedClass.title, numberStudents: _selectedClass.getMembers().length, numberRatings: trackings['total']) :
      chartInfo = ChartStudentInfo(fullName: _selectedStudent.getFullName(), mail: _selectedStudent.mail, numberRatings: trackings['total']);
    return BarChart(
      trackings: trackings,
      chartInfo: chartInfo,
    );
  }
}
