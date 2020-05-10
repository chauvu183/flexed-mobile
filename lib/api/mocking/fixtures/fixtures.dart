import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/mail_type.dart';
import 'package:flexed_mobile/types/data/phone_number_type.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flexed_mobile/types/enums/special_educational_needs.dart';

class Fixtures {

  /// Used to remove time component of DateTime, e.g. for birthdays
  static DateTime removeTime(DateTime dateTime) {
    return new DateTime(dateTime.year, dateTime.month, dateTime.day);
  }

  static final List<Student> students = [
    Student(
          id: 1,
          firstName: 'Peter',
          lastName: 'Pan',
          gender: Gender.MALE,
          birthday: DateTime.parse("2010-04-08"),
          mail: MailType("p.pan@example.com"),
          parentMail: MailType("n.pan@example.com"),
          phone: PhoneNumberType("01235 48912"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.SPECIAL_NEEDS,
          created: DateTime.now().subtract(Duration(days: 56)),
        ),

        Student(
          id: 2,
          firstName: 'Anneliese',
          lastName: 'Albern',
          gender: Gender.FEMALE,
          birthday: DateTime.parse("2009-11-25"),
          mail: MailType("albern2@example.com"),
          parentMail: MailType("albern2@example.com"),
          phone: PhoneNumberType("01265815858"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.NONE,
          created: DateTime.now().subtract(Duration(days: 44)),
        ),

        Student(
          id: 3,
          firstName: 'Berta',
          lastName: 'Bunt',
          gender: Gender.FEMALE,
          birthday: DateTime.parse("2011-01-05"),
          mail: MailType("familie-bunt@example.com"),
          parentMail: MailType("familie-bunt@example.com"),
          phone: PhoneNumberType("5874285752"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.NONE,
          created: DateTime.now().subtract(Duration(days: 56)),
        ),

        Student(
          id: 4,
          firstName: 'Corinna',
          lastName: 'Crutzk',
          gender: Gender.FEMALE,
          birthday: DateTime.parse("2010-08-24"),
          mail: MailType("corinna.crutzk@example.com"),
          parentMail: MailType("volker.crutzk@example.com"),
          phone: PhoneNumberType("123478121"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.SPECIAL_NEEDS,
          created: DateTime.now().subtract(Duration(days: 55)),
        ),

        Student(
          id: 5,
          firstName: 'Dorian',
          lastName: 'Doof',
          gender: Gender.MALE,
          birthday: DateTime.parse("2008-02-28"),
          mail: MailType("die-doofs@example.com"),
          parentMail: MailType("die-doofs@example.com"),
          phone: PhoneNumberType("0123456789"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.NONE,
          created: DateTime.now().subtract(Duration(days: 54)),
        ),

        Student(
          id: 6,
          firstName: 'Emil',
          lastName: 'Eichhorn',
          gender: Gender.MALE,
          birthday: DateTime.parse("2009-05-02"),
          mail: MailType("eichhorn.emil@example.com"),
          parentMail: MailType("eichhorns@example.com"),
          phone: PhoneNumberType("2561478"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.NONE,
          created: DateTime.now().subtract(Duration(days: 54)),
        ),
        Student(
          id: 7,
          firstName: 'Frank',
          lastName: 'Fleißig',
          gender: Gender.MALE,
          birthday: DateTime.parse("2009-05-02"),
          mail: MailType("frankyboy@example.com"),
          parentMail: MailType("fleissig-familie@example.com"),
          phone: PhoneNumberType("2561478"),
          note: null,
          specialEducationalNeeds: SpecialEducationalNeeds.GERMAN_AS_SECOND_LANGUAGE,
          created: DateTime.now().subtract(Duration(days: 54)),
        ),
  ];

  static final List<FlexClass> classes = [
    FlexClass(
      id: 1, 
      title: 'F1',
      created: DateTime.now().subtract(Duration(days: 13)),
      members: [
        students[0],
        students[1],
        students[2],
        students[3],
      ],
    ),

    FlexClass(
      id: 2, 
      title: 'F2',
      created: DateTime.now().subtract(Duration(days: 5)),
      members: [
        students[4],
        students[5],
        students[6],
      ],
    )
  ];


  static final List<SOLTrack> trackings = [
    SOLTrack(
      id: 1,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.AVERAGE,
    ),
    SOLTrack(
      id: 2,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 3,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 4,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 5,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 6,
      student: students[0],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.UNDEFINED,
    ),



    SOLTrack(
      id: 7,
      student: students[1],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 8,
      student: students[1],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 9,
      student: students[1],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.QUITEBAD,
    ),
    SOLTrack(
      id: 10,
      student: students[1],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.UNDEFINED,
    ),


    SOLTrack(
      id: 11,
      student: students[2],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.QUITEBAD,
    ),
    SOLTrack(
      id: 12,
      student: students[2],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 13,
      student: students[2],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 13,
      student: students[2],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 14,
      student: students[2],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.UNDEFINED,
    ),



    SOLTrack(
      id: 15,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 16,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 17,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 18,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 19,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.UNDEFINED,
    ),
    SOLTrack(
      id: 20,
      student: students[3],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.UNDEFINED,
    ),



    SOLTrack(
      id: 21,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 22,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 23,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 24,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 25,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 26,
      student: students[4],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.UNDEFINED,
    ),


    SOLTrack(
      id: 27,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 28,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 29,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 30,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 31,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 32,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.UNDEFINED,
    ),

    SOLTrack(
      id: 33,
      student: students[6],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 34,
      student: students[6],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 35,
      student: students[6],
      date: removeTime(DateTime.now().subtract(Duration(days: 0))),
      lessonNumber: 3,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 36,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 37,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 2,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.QUITEBAD,
    ),
    SOLTrack(
      id: 38,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 1))),
      lessonNumber: 3,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 39,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 40,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 2,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.QUITEBAD,
    ),
    SOLTrack(
      id: 41,
      student: students[5],
      date: removeTime(DateTime.now().subtract(Duration(days: 2))),
      lessonNumber: 3,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
  ];
}