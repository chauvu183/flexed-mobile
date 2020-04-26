import 'dart:math';

import 'package:flexed_mobile/api/mocking/flexclass_mocker.dart';
import 'package:flexed_mobile/api/mocking/soltrack_mocker.dart';
import 'package:flexed_mobile/api/mocking/student_mocker.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

class MockDataSource {

  static final int NUMBER_CLASSES     = 7;
  static final int STUDENTS_PER_CLASS = 15;
  static final int TRACKING_PER_CLASS = 7;

  static final MockDataSource instance = MockDataSource();

  static getInstance() {
    return instance;
  }

  static int STUDENT_ID  = NUMBER_CLASSES * STUDENTS_PER_CLASS + 1;
  static int CLASS_ID    = NUMBER_CLASSES + 1;
  static int TRACKING_ID = NUMBER_CLASSES * TRACKING_PER_CLASS + 1;

  List<Student> students = [];
  List<FlexClass> flexclasses = [];
  List<SOLTrack> trackings = [];

  StudentMocker _studentMocker = StudentMocker();
  FlexClassMocker _flexClassMocker = FlexClassMocker();
  SOLTrackMocker _solTrackMocker = SOLTrackMocker();

  Random _random = Random();

  MockDataSource() {
    flexclasses = _flexClassMocker.mockFlexClasses(number: NUMBER_CLASSES);

    flexclasses.forEach((_class) { 
      for(int i = STUDENTS_PER_CLASS; i > 0; i--) {
        Student student = _studentMocker.mockStudent();
        students.add(student);
        _class.addMember(student);
      }

      trackings.addAll(_solTrackMocker.mockSOLTracks(flexclass: _class, number: TRACKING_PER_CLASS));
    });
  }

}