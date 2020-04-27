import 'dart:io';

import 'package:flexed_mobile/pages/analyze/logic/soltrack_calculator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/repository/flexclass_repository.dart';
import '../../api/repository/soltrack_repository.dart';
import '../../models/flexclass.dart';
import '../../models/soltrack.dart';
import '../../models/student.dart';
import 'charts/sol_chart.dart';
import 'charts/chart.dart';

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
  Chart _chart;
  bool showChart = false;

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
      _chart = _buildChart(SOLTrackCalculator.analyzeTrackings(_trackings));
    } else {
       _chart = _buildChart(SOLTrackCalculator.analyzeTrackings(_trackings));
    }
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Row(
            children: [
              DropdownButton<FlexClass>(
                value: _selectedClass,
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
                        SOLTrackCalculator.analyzeTrackings(_trackings));
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
                        SOLTrackCalculator.analyzeTrackings(_trackings));
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
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
          child: Column(
            children: [
              showChart ? _chart : new Container(width: 0, height: 0),
            ],
          ),
        ),
      ],
    );
  }

  _refreshFlexClass() {
    _flexClassRepository
        .index()
        .then((flexclasses) => setState(() => {
          _createdClasses = flexclasses
          }
          ));
  }

  _refreshTrackingsByClass(List<Student> students) {
    _trackRepository.byStudents(students).then((trackings) => {
          _trackings = trackings,
          _chart = _buildChart(SOLTrackCalculator.analyzeTrackings(_trackings))
        });
    showChart = true;
  }

  _refreshTrackingsByStudent(Student student) {
    _trackRepository
        .byStudent(student)
        .then((trackings) => {_trackings = trackings});
    showChart = true;
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
      print("trackings updated -> $_trackings");
      return CircularProgressIndicator();
    }
    return _buildContent();
  }

  SOLChart _buildChart(Map<String, int> trackings) {
    print(trackings);
    return SOLChart(
      flexClass: _selectedClass,
      total: trackings['total'].toDouble(),
      german: trackings['deutsch'].toDouble(),
      english: trackings['englisch'].toDouble(),
      math: trackings['mathematik'].toDouble(),
    );
  }
}
