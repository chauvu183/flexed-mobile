import 'package:flexed_mobile/api/repository/mock/mock_data_source.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';

/// Student mock repository that generates fake data
/// on initialization, that can then be worked on inside
/// the application without persisting any changes to any
/// real database.
class SOLTrackMockRepository extends SOLTrackRepository {

  MockDataSource dataSource = MockDataSource.getInstance();

  @override
  Future<SOLTrack> create(SOLTrack model) async {
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(SOLTrack model) async {
    throw UnimplementedError();
  }

  @override
  Future<List<SOLTrack>> index() async {
    return dataSource.trackings;
  }

  @override
  Future<SOLTrack> show(int key) async {
    return dataSource.trackings.firstWhere((tracking) => tracking.id == key);
  }

  Future<List<SOLTrack>> byStudent(Student student) async {
      return List.of(dataSource.trackings.where((tracking) => tracking.student.id == student.id));
  }

  Future<List<SOLTrack>> byStudents(List<Student> students) async {
    List<SOLTrack> result = [];

    students.forEach((student) { 
      result.addAll(dataSource.trackings.where((tracking) => tracking.student.id == student.id));
    });

    return result;
  }

  @override
  Future<SOLTrack> update(SOLTrack model) async {
    throw UnimplementedError();
  }

}