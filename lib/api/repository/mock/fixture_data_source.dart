import 'dart:math';

import 'package:flexed_mobile/api/mocking/fixtures/fixtures.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

class FixtureDataSource {
  static final FixtureDataSource instance = FixtureDataSource();

  static getInstance() {
    return instance;
  }

  static int STUDENT_ID  = Fixtures.students[Fixtures.students.length - 1].id;
  static int CLASS_ID    = Fixtures.classes[Fixtures.classes.length - 1].id;
  static int TRACKING_ID = Fixtures.trackings[Fixtures.trackings.length - 1].id;

  List<Student> students = Fixtures.students;
  List<FlexClass> flexclasses = Fixtures.classes;
  List<SOLTrack> trackings = Fixtures.trackings;

}