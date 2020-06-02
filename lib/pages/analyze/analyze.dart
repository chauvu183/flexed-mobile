import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/repository/flexclass_repository.dart';
import '../../api/repository/soltrack_repository.dart';
import '../../models/flexclass.dart';
import '../../models/soltrack.dart';
import '../../models/student.dart';

import './charts/placeholder_chart.dart';
import './charts/rating_chart.dart';
import './charts/subject_chart.dart';
import './charts/widgets/info_card/chart_rating_class_info.dart';
import './charts/widgets/info_card/chart_rating_student_info.dart';
import './charts/widgets/info_card/chart_subject_class_info.dart';
import './charts/widgets/info_card/ichart_info.dart';
import './charts/widgets/info_card/chart_subject_student_info.dart';
import './charts/ichart.dart';
import './logic/soltrack_calculator.dart';
import './selectionbar/selection_bar.dart';

class Analyze extends StatefulWidget {
  @override
  _AnalyzeState createState() => _AnalyzeState();
}

class _AnalyzeState extends State<Analyze> {
  FlexClassRepository _flexClassRepository;
  SOLTrackRepository _trackRepository;
  FlexClass _selectedClass;
  Student _selectedStudent;
  String _analyzeType;
  List<FlexClass> _createdClasses = List();
  List<SOLTrack> _trackings = List();
  IChart _chart;

  callBackSelectedClass(selectedClass) {
    setState(() {
      _selectedClass = selectedClass;
    });
  }

  callBackSelectedStudent(selectedStudent) {
    setState(() {
      _selectedStudent = selectedStudent;
    });
  }

  callBackSelectedAnalyzeType(selectedAnalyzeType) {
    setState(() {
      _analyzeType = selectedAnalyzeType;
    });
  }

  @override
  Widget build(BuildContext context) {
    _flexClassRepository = Provider.of<FlexClassRepository>(context);
    _trackRepository = Provider.of<SOLTrackRepository>(context);

    _refreshFlexClass();

  
     return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.bottomRight,
            image: AssetImage(
              'images/background-03-02.png',
            ),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectionBar(
              createdClasses: _createdClasses,
              selectedClass: _selectedClass,
              selectedStudent: _selectedStudent,
              analyzeType: _analyzeType,
              callBackSelectedClass: callBackSelectedClass,
              callBackSelectedStudent: callBackSelectedStudent,
              callBackSelectedAnalyzeType: callBackSelectedAnalyzeType,
            ),
            Expanded(
              child: Container(
                color: Colors.white,
                child: _buildContent(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_selectedClass == null) {
      _chart = PlaceholderChart();
    } else {
      _selectedStudent == null
          ? _refreshTrackingsByClass(_selectedClass.getMembers())
          : _refreshTrackingsByStudent(_selectedStudent);
      if (_analyzeType == null) {
        _analyzeType = 'Fach';
      }
      _buildChart();
    }

    return Center(
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.all(5.0),
        child: AnimatedSwitcher(
          duration: Duration(
            milliseconds: 1000,
          ),
          child: _chart,
        ),
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
        });
  }

  _refreshTrackingsByStudent(Student student) async {
    await _trackRepository
        .byStudent(student)
        .then((trackings) => {_trackings = trackings});
  }

  _buildChart() {
    Map<String, int> trackings;
    if (_analyzeType == 'Fach') {
      trackings = SOLTrackCalculator.analyzeTrackingsBySOL(_trackings);
      _chart = SubjectChart(
        trackings: trackings,
        chartInfo: _buildChartInfo(trackings),
      );
    } else {
      trackings = SOLTrackCalculator.analyzeTrackingsByRating(_trackings);
      _chart = RatingChart(
        trackings: trackings,
        chartInfo: _buildChartInfo(trackings),
      );
    }
  }

  IChartInfo _buildChartInfo(Map<String, int> trackings) {
    IChartInfo chartInfo;
    _analyzeType == 'Fach'
        ? chartInfo = _selectedStudent == null
            ? ChartSubjectClassInfo(
                title: _selectedClass.title,
                numberStudents: _selectedClass.getMembers().length,
                solTrackingsRated: trackings['total'],
                solTrackingsOpen: trackings['undefined'],
              )
            : ChartSubjectStudentInfo(
                fullName: _selectedStudent.getFullName(),
                specialEducationalNeeds:
                    _selectedStudent.specialEducationalNeeds,
                solTrackingsRated: trackings['total'],
                solTrackingsOpen: trackings['undefined'],
                gender: _selectedStudent.gender,
              )
        : chartInfo = _selectedStudent == null
            ? ChartRatingClassInfo(
                title: _selectedClass.title,
                numberStudents: _selectedClass.getMembers().length,
                numberRatings: trackings['total'],
              )
            : ChartRatingStudentInfo(
                fullName: _selectedStudent.getFullName(),
                specialEducationalNeeds:
                    _selectedStudent.specialEducationalNeeds,
                numberRatings: trackings['total'],
                gender: _selectedStudent.gender,
              );
    return chartInfo;
  }
}
