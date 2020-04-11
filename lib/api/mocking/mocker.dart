

import 'dart:math';

import 'package:flexed_mobile/types/gender.dart';
import 'package:flexed_mobile/types/mail.dart';
import 'package:flexed_mobile/types/phone.dart';

abstract class Mocker {

  /// Maps the currently generated primary keys
  Map<String, int> keys = Map<String, int>();

  Map<String, String> getFields();


  final List<String> _firstNames = [
      'Peter', 'Lisa', 'Günther', 'Clemens', 'Chau', 'Julius', 'Maria', 'Gustav',
      'Hermelin-Theo', 'Üzgön', 'Al-Chad'
  ];

  final List<String> _lastNames = [
      'Pan', 'Lüdermeier', 'Krußsvoc', 'Änie', 'Schulz', 'Schultz'
  ];

  final List<Gender> _genders = [
      Gender.MALE, Gender.FEMALE
  ];

  final List<Mail> _mails = [
    Mail('p.pan@example.com'), Mail('luedemeier@example.com'), Mail('ban.schools@example.com'), 
    Mail('not.real@example.com'), Mail('unhackable@example.com'), Mail('foreign@example.com'),
    Mail('familie.schulz@example.com'), Mail('aenie@example.com'), Mail('ldefg@example.com'), 
    Mail('wtf@example.com')
  ];

  final String _boilerplate = '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus aliquet eu nunc ut vestibulum. 
Vivamus feugiat pharetra nisl sed varius. Pellentesque viverra, nulla quis consequat finibus, neque 
libero aliquam eros, non auctor libero dui eget sem. Aenean mollis enim ac leo efficitur lobortis. 
Donec eu pulvinar lorem. Fusce faucibus enim vitae egestas condimentum. Suspendisse sem nunc, sagittis 
condimentum quam non, pharetra consequat leo. Sed et elit magna. Nam sed nulla ut ligula porttitor 
finibus eget eget risus. Pellentesque vitae commodo turpis. Quisque dapibus ante ac augue congue vulputate. 
Nunc eu ante dapibus, mattis est ac, vestibulum nulla.

Etiam enim sem, lobortis suscipit lacinia a, laoreet rutrum velit. Nam et leo quis dolor scelerisque interdum. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra molestie purus, vitae porttitor risus 
posuere et. Morbi molestie enim magna, at iaculis dolor laoreet ut. Aliquam posuere erat feugiat arcu posuere 
vestibulum. Aenean eu nisl laoreet, commodo augue vel, volutpat lectus. Fusce vel nunc interdum, pulvinar 
nulla nec, tempor felis. Cras arcu est, tempor at dapibus et, lacinia in magna. Praesent euismod maximus 
libero nec varius. Duis cursus leo a imperdiet hendrerit. Sed laoreet libero eu fermentum laoreet. 
Praesent ultricies ligula quam, ac convallis mi commodo id.

Morbi efficitur quam non felis rutrum, sit amet tincidunt sem rutrum. Proin euismod, purus sed sodales semper, 
nunc libero ullamcorper tellus, non elementum nulla felis at odio. Integer vel iaculis massa, ut dignissim 
tellus. Phasellus volutpat turpis sed lacus elementum, a pulvinar dui laoreet. Morbi sit amet diam nisl. 
In eleifend quam at nunc fringilla venenatis. Lorem ipsum dolor sit amet, consectetur adipiscing elit.

Nulla sagittis justo et nisi lacinia molestie. Fusce in pellentesque nunc. Nulla odio nulla, cursus eu elementum 
eu, facilisis pellentesque purus. Vivamus eget lobortis lectus. Praesent maximus volutpat justo eget facilisis. 
Curabitur ac scelerisque tortor, vehicula molestie velit. Nam elementum sollicitudin metus. Ut sed magna lacus. 
Fusce eleifend, libero vitae suscipit dignissim, elit urna condimentum quam, ac ultrices eros urna quis metus. 
Etiam imperdiet consectetur mi, in sodales dui consequat et. Nulla facilisi.

Etiam sagittis, nunc in blandit tristique, ligula libero bibendum sem, ac sollicitudin velit eros id magna. 
Etiam pharetra augue et ante cursus, vitae condimentum tortor sagittis. Duis justo neque, consequat et risus 
id, bibendum rutrum odio. Pellentesque eu massa imperdiet, condimentum est eu, finibus felis. Aenean a vehicula 
sapien, molestie interdum erat. Pellentesque et metus tincidunt, pretium enim at, imperdiet ipsum. 
Nunc at efficitur massa.''';

  final _random = new Random();


  Mocker() {
    _buildKeyMap();
  }


  void _buildKeyMap() {
    Map<String, String> fields = getFields();

    fields.forEach((key, type) {
      if (type == 'key') {
        keys.putIfAbsent(key, () => 0);
      }
    });
  }


  Map<String, Object> mock() {
    Map<String, Object> data = Map<String, Object>();
    Map<String, String> fields = getFields();

    fields.forEach((field, type) {
      if (type == 'key') {
        data.addAll({ field: _generateKey(field) });
      } else {
        data.addAll({ field: _generateByType(type) });
      }

    });

    return data;
  }

  int _generateKey(String field) {
    int key = ++keys[field];

    return key;
  }

  Object _generateByType(String type) {
    switch(type) {
      case 'firstName':
        return _generateFirstName();

      case 'lastName':
        return _generateLastName();

      case 'gender':
        return _generateGender();

      case 'date':
        return _generateDate();

      case 'mail':
        return _generateMail();

      case 'phone':
        return _generatePhone();

      case 'loremipsum':
        return _generateBoilerText();
    }

    return null;
  }


  String _generateFirstName() {
    return _firstNames[_random.nextInt(_firstNames.length)];
  }

  String _generateLastName() {
    return _lastNames[_random.nextInt(_lastNames.length)];
  }

  Gender _generateGender() {
    return _genders[_random.nextInt(_genders.length)];
  }

  DateTime _generateDate() {
    return DateTime.now();
  }


  Mail _generateMail() {
    return _mails[_random.nextInt(_mails.length)];
  }

  PhoneNumber _generatePhone() {
    String phone = '';
    List<int> numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    while(phone.length < 8) {
      phone += numbers[_random.nextInt(numbers.length)].toString();
    }

    return PhoneNumber(phone);
  }

  String _generateBoilerText() {
    int start = _random.nextInt(_boilerplate.length - 151);
    int end   = start + 150;

    return _boilerplate.substring(start, end);
  }

}