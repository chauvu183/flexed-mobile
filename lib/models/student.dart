import 'package:flexed_mobile/models/model.dart';
import 'package:flexed_mobile/types/gender.dart';
import 'package:flexed_mobile/types/mail.dart';
import 'package:flexed_mobile/types/phone.dart';
import 'package:flutter/cupertino.dart';

/// Represents a student of a class
class Student extends Model {

  /// Primary key of student instance
  int id;

  String firstName;
  String lastName;
  Gender gender;
  DateTime birthday;

  Mail mail;
  Mail parentMail;

  PhoneNumber phone;

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
    this.created
  });

  String _getFirstLetter(String value) {
    return value.substring(0, 1);
  }

  String getInitials() {
    return _getFirstLetter(firstName).toUpperCase() + _getFirstLetter(lastName).toUpperCase();
  }

  String toString() {
    return '$id: $firstName $lastName (${getInitials()})';
  }

}