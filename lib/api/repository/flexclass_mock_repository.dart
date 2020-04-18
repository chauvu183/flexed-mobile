

import 'package:flexed_mobile/api/mocking/flexclass_mocker.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/student.dart';

/// Student mock repository that generates fake data
/// on initialization, that can then be worked on inside
/// the application without persisting any changes to any
/// real database.
class FlexClassMockRepository extends FlexClassRepository {

  /// Student mocker that generates fake data
  FlexClassMocker _mocker = FlexClassMocker();

  /// List of mocked students is persisted to this
  /// list, so that changes can be made on actual data
  List<FlexClass> _classes = [];

  FlexClassMockRepository() {
    // generate mock students on initialization
    _classes = _mocker.mockFlexClasses(number: 5);
  }

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
    return _classes;
  }

  @override
  Future<FlexClass> show(int key) async {
    return _classes.firstWhere((_class) => _class.id == key);
  }

  @override
  Future<FlexClass> update(FlexClass model) async {
    throw UnimplementedError();
  }

}