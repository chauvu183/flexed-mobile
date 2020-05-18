import 'package:flexed_mobile/pages/analyze/charts/rating_chart.dart';
import 'package:flexed_mobile/pages/analyze/charts/subject_chart.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_rating_class_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_rating_student_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_subject_class_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/chart_subject_student_info.dart';
import 'package:flexed_mobile/pages/analyze/logic/soltrack_calculator.dart';
import 'package:flexed_mobile/pages/analyze/selectionbar/analyze_home_card.dart';
import 'package:flexed_mobile/pages/analyze/selectionbar/selection_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../api/repository/flexclass_repository.dart';
import '../../api/repository/soltrack_repository.dart';
import '../../models/flexclass.dart';
import '../../models/soltrack.dart';
import '../../models/student.dart';
import 'charts/ichart.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: Text("Analyse"),
      ),
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
          _selectedClass == null
              ? Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: AnalyzeHomeCard(),
                    ),
                  ),
                )
              : _buildContent(),
        ],
      ),
    );
  }

  Widget _buildContent() {
    _selectedStudent == null
        ? _refreshTrackingsByClass(_selectedClass.getMembers())
        : _refreshTrackingsByStudent(_selectedStudent);
    if (_analyzeType == null) {
      _analyzeType = 'Fach';
    }

    _chart = _analyzeType == 'Fach'
        ? _buildSubjectChart(
            SOLTrackCalculator.analyzeTrackingsBySOL(_trackings))
        : _buildRatingChart(
            SOLTrackCalculator.analyzeTrackingsByRating(_trackings),
          );

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedSwitcher(
            duration: Duration(
              milliseconds: 1000,
            ),
            child: _chart,
          ),
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
          _chart = _buildSubjectChart(
              SOLTrackCalculator.analyzeTrackingsBySOL(_trackings))
        });
  }

  _refreshTrackingsByStudent(Student student) async {
    await _trackRepository
        .byStudent(student)
        .then((trackings) => {_trackings = trackings});
  }

  SubjectChart _buildSubjectChart(Map<String, int> trackings) {
    return SubjectChart(
      trackings: trackings,
      chartInfo: _buildChartInfo(trackings),
    );
  }

  RatingChart _buildRatingChart(Map<String, int> trackings) {
    return RatingChart(
      trackings: trackings,
      chartInfo: _buildChartInfo(trackings),
    );
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
              );
    return chartInfo;
  }
}
