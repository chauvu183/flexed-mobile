import 'package:flexed_mobile/api/mocking/flexclass_mocker.dart';
import 'package:flexed_mobile/api/mocking/soltrack_mocker.dart';
import 'package:flexed_mobile/api/mocking/student_mocker.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

class MockDataSource {

  static final MockDataSource instance = MockDataSource();

  static getInstance() {
    return instance;
  }

  List<Student> students = [];
  List<FlexClass> flexclasses = [];
  List<SOLTrack> trackings = [];

  StudentMocker _studentMocker = StudentMocker();
  FlexClassMocker _flexClassMocker = FlexClassMocker();
  SOLTrackMocker _solTrackMocker = SOLTrackMocker();

  MockDataSource() {
    flexclasses = _flexClassMocker.mockFlexClasses(number: 7);

    flexclasses.forEach((_class) { 
      for(int i = 0; i < 15; i++) {
        Student student = _studentMocker.mockStudent();
        students.add(student);
        _class.addMember(student);
      }

      trackings.addAll(_solTrackMocker.mockSOLTracks(flexclass: _class, number: 5));
    });
  }

}