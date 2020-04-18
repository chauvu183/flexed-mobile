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
    throw UnimplementedError();
  }

  @override
  Future<bool> delete(FlexClass model) async {
    throw UnimplementedError();
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
    throw UnimplementedError();
  }

}