

import 'package:flexed_mobile/api/mocking/student_mocker.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/models/student.dart';

class StudentMockRepository extends StudentRepository {

  StudentMocker _mocker = StudentMocker();

  List<Student> _students = [];

  StudentMockRepository() {
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