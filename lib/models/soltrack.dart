import 'package:flexed_mobile/models/model.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/foundation.dart';

class SOLTrack extends Model {
  int id;
  Student student;
  DateTime date;
  int lessonNumber;
  SubjectType subject;
  Rating rating;
  
  
  SOLTrack({
    this.id,
    @required this.student,
    @required this.date,
    @required this.lessonNumber,
    @required this.subject,
    this.rating = Rating.UNDEFINED,
  });

}