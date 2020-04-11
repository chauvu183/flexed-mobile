

import 'package:flexed_mobile/models/model.dart';
import 'package:flexed_mobile/types/gender.dart';
import 'package:flexed_mobile/types/mail.dart';
import 'package:flexed_mobile/types/phone.dart';
import 'package:flutter/cupertino.dart';

class Student extends Model {

  /// Primary key of student instance
  int _id;

  String _firstName;
  String _lastName;
  Gender _gender;
  DateTime _birthday;

  Mail _mail;
  Mail _parentMail;

  PhoneNumber _phone;

  String _note;

  DateTime _created;


  Student({
    int id,
    @required String firstName,
    @required String lastName,
    Gender gender,
    DateTime birthday,
    Mail mail,
    Mail parentMail,
    PhoneNumber phone,
    String note,
    DateTime created
  }) {
    this._id = id;
    this._firstName = firstName;
    this._lastName = lastName;
    this._gender = gender;
    this._birthday = birthday;
    this._mail = mail;
    this._parentMail = parentMail;
    this._phone = phone;
    this._note = note;
    this._created = created;
  }


  String _getFirstLetter(String value) {
    return value.substring(0, 1);
  }

  String getInitials() {
    return _getFirstLetter(_firstName).toUpperCase() + _getFirstLetter(_lastName).toUpperCase();
  }

  String toString() {
    return _firstName + ' ' + _lastName + ' (' + this.getInitials() + ')';
  }

}