import 'package:flexed_mobile/models/model.dart';
import 'package:flexed_mobile/types/data/mail_type.dart';
import 'package:flexed_mobile/types/data/phone_number_type.dart';
import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flexed_mobile/types/enums/special_educational_needs.dart';
import 'package:flutter/foundation.dart';

/// Represents a student of a class
class Student extends Model {

  /// Primary key of student instance
  int id;

  String firstName;
  String lastName;
  Gender gender;
  DateTime birthday;

  MailType mail;
  MailType parentMail;

  PhoneNumberType phone;

  SpecialEducationalNeeds specialEducationalNeeds;
  String note;

  DateTime created;


  Student({
    this.id,
    @required this.firstName,
    @required this.lastName,
    this.gender,
    this.birthday,
    this.mail,
    this.parentMail,
    this.phone,
    this.note,
    this.specialEducationalNeeds,
    this.created
  });

  String _getFirstLetter(String value) {
    return value.substring(0, 1);
  }

  String getInitials() {
    return _getFirstLetter(firstName).toUpperCase() + _getFirstLetter(lastName).toUpperCase();
  }

  String getFullName() {
    return '$firstName $lastName';
  }

  String toString() {
    return '$id: $firstName $lastName (${getInitials()})';
  }

}