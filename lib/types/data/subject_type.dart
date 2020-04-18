import 'package:flutter/material.dart';

class SubjectType {
  int id;
  String title;
  DateTime created;

  List<String> _subjects = [
    'deutsch',
    'englisch',
    'mathematik',
  ];

  SubjectType({this.id, @required this.title, this.created });

  bool isValid(String subject) => _subjects.contains(subject.toLowerCase()); 
}