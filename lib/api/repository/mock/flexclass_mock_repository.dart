import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/mock/mock_data_source.dart';
import 'package:flexed_mobile/models/flexclass.dart';

/// Student mock repository that generates fake data
/// on initialization, that can then be worked on inside
/// the application without persisting any changes to any
/// real database.
class FlexClassMockRepository extends FlexClassRepository {

  MockDataSource dataSource = MockDataSource.getInstance();

  @override
  Future<FlexClass> create(FlexClass model) async {
    dataSource.flexclasses.add(model);

    return model;
  }

  @override
  Future<bool> delete(int key) async {
    dataSource.students.removeWhere((flexclasses) => flexclasses.id == key);

    return true;
  }

  @override
  Future<List<FlexClass>> index() async {
    return dataSource.flexclasses;
  }

  @override
  Future<FlexClass> show(int key) async {
    return dataSource.flexclasses.firstWhere((_class) => _class.id == key);
  }

  @override
  Future<FlexClass> update(FlexClass model) async {
    FlexClass existing = dataSource.flexclasses.firstWhere((flexclass) => flexclass.id == model.id);
    int index = dataSource.flexclasses.indexOf(existing);
    dataSource.flexclasses[index] = model;

    return dataSource.flexclasses[index];
  }

}