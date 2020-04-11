

import 'package:flexed_mobile/api/mocking/student_mocker.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/models/student.dart';

/// Student mock repository that generates fake data
/// on initialization, that can then be worked on inside
/// the application without persisting any changes to any
/// real database.
class StudentMockRepository extends StudentRepository {

  /// Student mocker that generates fake data
  StudentMocker _mocker = StudentMocker();

  /// List of mocked students is persisted to this
  /// list, so that changes can be made on actual data
  List<Student> _students = [];

  StudentMockRepository() {
    // generate mock students on initialization
    _students = _mocker.mockStudents(number: 50);
  }

  @override
  Future<Student> create(Student model) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(Student model) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Student>> index() async {
    return _students;
  }

  @override
  Future<Student> show(int key) async {
    return _students.firstWhere((student) => student.id == key);
  }

  @override
  Future<Student> update(Student model) async {
    throw UnimplementedError();
  }

}