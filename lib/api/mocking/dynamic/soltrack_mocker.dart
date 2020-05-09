
import 'dart:math';

import 'package:flexed_mobile/api/mocking/dynamic/mocker.dart';
import 'package:flexed_mobile/api/mocking/dynamic/student_mocker.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flutter/foundation.dart';

/// Mocker that generates new, fake student model instances.
class SOLTrackMocker extends Mocker {

  /// Map of fields by their type to fill
  /// with appropriate data
  final Map<String, String> _fields = {
    'id': 'key',
    'date': 'date',
    'subject': 'subject',
    'lessonNumber': 'key',
  };

  /// Mocks a new SOL track unit, then injects the generated
  /// data into a model instance to return
  SOLTrack mockSOLTrack(FlexClass flexclass) {
    if (flexclass.getMembers().length < 1) {
      throw Exception('Can not mock SOLTrack instances with empty flex class');
    }

    Random rand = Random();
    List<Student> students = flexclass.getMembers();

    Map<String, Object> mockedData = this.mock();
    return SOLTrack(
      id:              mockedData['id'],
      date:            mockedData['date'],
      student:         students[rand.nextInt(students.length)],
      subject:         mockedData['subject'],
      lessonNumber:    mockedData['lessonNumber'],
    );
  }

  /// Utility method to generate a list of instances
  List<SOLTrack> mockSOLTracks({ @required FlexClass flexclass, number = 3 }) {
    List<SOLTrack> generated = List<SOLTrack>();
    for(int i = 0; i < number; i++) {
      generated.add(mockSOLTrack(flexclass));
    }

    return generated;
  }

  @override
  Map<String, String> getFields() {
    return _fields;
  }

}