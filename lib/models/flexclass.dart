import 'package:flexed_mobile/models/model.dart';
import 'package:flutter/cupertino.dart';

import 'student.dart';

class FlexClass extends Model {
  int id;
  String title;
  List<Student> members;
  DateTime created;
  
  FlexClass({
    this.id,
    @required this.title,
    this.members,
    this.created,
  });

  List<Student> getMembers() => this.members;
}