import 'package:flexed_mobile/api/mocking/fixtures/fixtures.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/mail_type.dart';
import 'package:flexed_mobile/types/data/phone_number_type.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flexed_mobile/types/enums/special_educational_needs.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  List<Student> students = Fixtures.students;
  List<SOLTrack> trackings = Fixtures.trackings;
  List<FlexClass> classes = Fixtures.classes;

  group('UNIT TESTS MODELS:', () {
    group("STUDENT", () {
      Student student = students[0];
      test("Testing ID", () {
        expect(student.id, 1);
      });
      test("Testing FIRSTNAME", () {
        expect(student.firstName, "Peter");
      });
      test("Testing LASTNAME", () {
        expect(student.lastName, "Pan");
      });
      test("Testing FULLNAME", () {
        expect(student.getFullName(), "Peter Pan");
      });
      test("Testing GENDER", () {
        expect(student.gender, Gender.MALE);
      });
      test("Testing BIRTHDAY", () {
        expect(student.birthday, DateTime.parse("2010-04-08"));
      });
      test("Testing MAIL", () {
        expect(student.mail.isValid(), true);
      });
      test("Testing PARENTMAIL", () {
        expect(student.parentMail.isValid(), true);
      });
      test("Testing PHONE", () {
        expect(student.phone.isValid(), true);
      });
      test("Testing NOTE", () {
        expect(student.note, null);
      });
      test("Testing SPECIAL NEEDS", () {
        expect(student.specialEducationalNeeds,
            SpecialEducationalNeeds.SPECIAL_NEEDS);
      });

      test("Testing CREATED", () {
        expect(student.created.year,
            DateTime.now().subtract(Duration(days: 56)).year);
        expect(student.created.month,
            DateTime.now().subtract(Duration(days: 56)).month);
        expect(student.created.day,
            DateTime.now().subtract(Duration(days: 56)).day);
      });
    });

    group("FLEXCLASS", () {
      FlexClass flexClass = classes[0];
      test("Testing ID", () {
        expect(flexClass.id, 1);
      });
      test("Testing TITLE", () {
        expect(flexClass.title, "F1");
      });
      test("Testing CREATED", () {
        expect(flexClass.created.year,
            DateTime.now().subtract(Duration(days: 13)).year);
        expect(flexClass.created.month,
            DateTime.now().subtract(Duration(days: 13)).month);
        expect(flexClass.created.day,
            DateTime.now().subtract(Duration(days: 13)).day);
      });
      test("Testing MEMBERS", () {
        expect(flexClass.getMembers().length, 4);
      });

      test("Testing ADDMEMBER", () {
        flexClass.addMember(students[4]);
        expect(flexClass.getMembers().length, 5);
        expect(flexClass.getMembers()[4], students[4]);
      });
    });

    group("SOLTRACKS", () {
      SOLTrack track = trackings[0];
      test("Testing ID", () {
        expect(track.id, 1);
      });
      test("Testing STUDENT", () {
        expect(track.student, students[0]);
      });
      test("Testing LESSONNUMBER", () {
        expect(track.lessonNumber, 1);
      });
      test("Testing SUBJECT", () {
        expect(track.subject.title, "Deutsch");
      });
      test("Testing RATING", () {
        expect(track.rating, Rating.AVERAGE);
      });
    });
  });

  group("MAIL TYPE", () {
    test("Testing Valid Mail", () {
      expect(new MailType("abc@alphabetical.com").isValid(), true);
    });
    test("Testing Invalid Mail", () {
      expect(new MailType("abcalphabetical.com").isValid(), false);
    });
  });

  group("PHONENUMBER TYPE", () {
    test("Testing Valid Phone", () {
      expect(new PhoneNumberType("0123456789").isValid(), true);
    });
    test("Testing Invalid Phone", () {
      expect(new PhoneNumberType("1234").isValid(), false);
    });
    test("Testing Invalid Phone", () {
      expect(new PhoneNumberType("ABC").isValid(), false);
    });
  });

  group("SUBJECT TYPE", () {
    test("Testing Valid SubjectType german", () {
      expect(new SubjectType(title: "deutsch").isValid(), true);
    });
    test("Testing Valid SubjectType english", () {
      expect(new SubjectType(title: "englisch").isValid(), true);
    });
    test("Testing Valid SubjectType math", () {
      expect(new SubjectType(title: "mathematik").isValid(), true);
    });
    test("Testing Invalid SubjectType", () {
      expect(new SubjectType(title: "1234").isValid(), false);
    });
    test("Testing Invalid SubjectType", () {
      expect(new SubjectType(title: "ABC").isValid(), false);
    });
  });
}
