
import 'package:flexed_mobile/api/mocking/mocker.dart';
import 'package:flexed_mobile/models/student.dart';

class StudentMocker extends Mocker {

  final Map<String, String> _fields = {
    'id': 'key',
    'firstName':  'firstName',
    'lastName':   'lastName',
    'gender':     'gender',
    'birthday':   'date',
    'mail':       'mail',
    'parentMail': 'mail',
    'phone':      'phone',
    'note':       'loremipsum',
    'created':    'date',
  };

  Student mockStudent() {
    Map<String, Object> mockedData = this.mock();
    return Student(
      id:         mockedData['id'],
      firstName:  mockedData['firstName'],
      lastName:   mockedData['lastName'],
      gender:     mockedData['gender'],
      birthday:   mockedData['birthday'],
      mail:       mockedData['mail'],
      parentMail: mockedData['parentMail'],
      phone:      mockedData['phone'],
      note:       mockedData['note'],
      created:    mockedData['created'],
    );
  }

  List<Student> mockStudents({ number = 3 }) {
    List<Student> generated = List<Student>();
    for(int i = 0; i < number; i++) {
      generated.add(mockStudent());
    }

    return generated;
  }

  @override
  Map<String, String> getFields() {
    return _fields;
  }

}