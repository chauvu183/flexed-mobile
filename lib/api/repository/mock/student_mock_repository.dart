import 'package:flexed_mobile/api/repository/mock/mock_data_source.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/models/student.dart';

/// Student mock repository that generates fake data
/// on initialization, that can then be worked on inside
/// the application without persisting any changes to any
/// real database.
class StudentMockRepository extends StudentRepository {

  MockDataSource dataSource = MockDataSource.getInstance();

  @override
  Future<Student> create(Student model) async {
    dataSource.students.add(model);

    return model;
  }

  @override
  Future<bool> delete(int key) async {
    dataSource.students.removeWhere((student) => student.id == key);

    return true;
  }

  @override
  Future<List<Student>> index() async {
    return dataSource.students;
  }

  @override
  Future<Student> show(int key) async {
    return dataSource.students.firstWhere((student) => student.id == key);
  }

  @override
  Future<Student> update(Student model) async {
    Student existing = dataSource.students.firstWhere((student) => student.id == model.id);
    int index = dataSource.students.indexOf(existing);
    dataSource.students[index] = model;

    return dataSource.students[index];
  }

}