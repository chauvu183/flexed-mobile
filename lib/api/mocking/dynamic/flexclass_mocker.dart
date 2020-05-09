
import 'package:flexed_mobile/api/mocking/dynamic/mocker.dart';
import 'package:flexed_mobile/models/flexclass.dart';

/// Mocker that generates new, fake student model instances.
class FlexClassMocker extends Mocker {

  /// Map of fields by their type to fill
  /// with appropriate data
  final Map<String, String> _fields = {
    'id': 'key',
    'title': 'prefixed_key:F',
    'created': 'date',
  };

  /// Mocks a new flex class, then injects the generated
  /// data into a model instance to return
  FlexClass mockFlexClass() {
    Map<String, Object> mockedData = this.mock();
    return FlexClass(
      id:         mockedData['id'],
      title:      mockedData['title'],
      created:    mockedData['created'],
    );
  }

  /// Utility method to generate a list of instances
  List<FlexClass> mockFlexClasses({ number = 3 }) {
    List<FlexClass> generated = List<FlexClass>();
    for(int i = 0; i < number; i++) {
      generated.add(mockFlexClass());
    }

    return generated;
  }

  @override
  Map<String, String> getFields() {
    return _fields;
  }

}