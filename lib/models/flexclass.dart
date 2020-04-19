import 'package:flexed_mobile/models/model.dart';
import 'package:flutter/foundation.dart';

import 'student.dart';

class FlexClass extends Model {
  int id;
  String title;
  List<Student> members = [];
  DateTime created;
  
  FlexClass({
    this.id,
    @required this.title,
    this.members,
    this.created,
  }) {
    if (members == null) {
      members = [];
    }
  }

  List<Student> getMembers() => this.members;
  
  void addMember(Student student) {
    members.add(student);
  }
}