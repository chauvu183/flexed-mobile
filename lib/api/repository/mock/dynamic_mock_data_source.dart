
import 'package:flexed_mobile/api/mocking/dynamic/flexclass_mocker.dart';
import 'package:flexed_mobile/api/mocking/dynamic/soltrack_mocker.dart';
import 'package:flexed_mobile/api/mocking/dynamic/student_mocker.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

class DynamicMockDataSource {

  static final int numberClasses     = 2;
  static final int studentsPerClass = 3;
  static final int trackingPerClass = 25;

  static final DynamicMockDataSource instance = DynamicMockDataSource();

  static getInstance() {
    return instance;
  }

  static int studentId  = numberClasses * studentsPerClass + 1;
  static int classId    = numberClasses + 1;
  static int trackingId = numberClasses * trackingPerClass + 1;

  List<Student> students = [];
  List<FlexClass> flexclasses = [];
  List<SOLTrack> trackings = [];

  StudentMocker _studentMocker = StudentMocker();
  FlexClassMocker _flexClassMocker = FlexClassMocker();
  SOLTrackMocker _solTrackMocker = SOLTrackMocker();

  DynamicMockDataSource() {
    flexclasses = _flexClassMocker.mockFlexClasses(number: numberClasses);

    flexclasses.forEach((_class) { 
      for(int i = studentsPerClass; i > 0; i--) {
        Student student = _studentMocker.mockStudent();
        students.add(student);
        _class.addMember(student);
      }

      trackings.addAll(_solTrackMocker.mockSOLTracks(flexclass: _class, number: trackingPerClass));
    });
  }

}