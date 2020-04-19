

import 'package:flexed_mobile/api/repository/repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

abstract class SOLTrackRepository extends Repository<SOLTrack> {
  Future<List<SOLTrack>> byStudents(List<Student> students);
  Future<List<SOLTrack>> byStudent(Student student);
}