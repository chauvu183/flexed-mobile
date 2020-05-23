import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/analyze/logic/soltrack_calculator.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Student student1 = Student(
    firstName: 'test',
    lastName: 'student',
    gender: Gender.MALE,
  );

  List<SOLTrack> emptyList = [];

  List<SOLTrack> trackings = [
    SOLTrack(
      id: 1,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 1,
      subject: SubjectType(title: "Deutsch"),
      rating: Rating.AVERAGE,
    ),
    SOLTrack(
      id: 2,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.GOOD,
    ),
    SOLTrack(
      id: 3,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 1,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.QUITEGOOD,
    ),
    SOLTrack(
      id: 4,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 2,
      subject: SubjectType(title: "Mathematik"),
      rating: Rating.QUITEBAD,
    ),
    SOLTrack(
      id: 5,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 1,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.BAD,
    ),
    SOLTrack(
      id: 6,
      student: student1,
      date: DateTime.now(),
      lessonNumber: 2,
      subject: SubjectType(title: "Englisch"),
      rating: Rating.UNDEFINED,
    ),
  ];

  group('SOLCalculator: by SOL', () {
    test('Empty SOL Tracks should return 0,0,0,0,0', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(emptyList);
      expect(result['total'],0);
      expect(result['deutsch'],0);
      expect(result['englisch'],0);
      expect(result['mathematik'],0);
      expect(result['undefined'],0);
    });
    test('Math should be 3', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      expect(result['mathematik'],3);
    });
    test('German should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      expect(result['deutsch'],1);
    });
    test('English should be 2', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      expect(result['englisch'],2);
    });
    test('Total should be 5', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      expect(result['total'],5);
    });
    test('Not rated (undefined) should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      expect(result['undefined'],1);
    });
    test('Total plus Undefined should match list length ', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsBySOL(trackings);
      int sum = result['total'] + result['undefined'];
      expect(sum,trackings.length);
    });
  });

  group('SOLCalculator: by Rating', () {
    test('Empty SOL Tracks should return 0,0,0,0,0,0', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(emptyList);
      expect(result['bad'],0);
      expect(result['quitebad'],0);
      expect(result['average'],0);
      expect(result['quitegood'],0);
      expect(result['good'],0);
      expect(result['undefined'],0);
    });
    test('Bad should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['bad'],1);
    });
    test('quite bad should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['quitebad'],1);
    });
    test('Average should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['average'],1);
    });
    test('quite good  should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['quitegood'],1);
    });
    test('Good should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['good'],1);
    });
    test('Not rated (undefined) should be 1', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['undefined'],1);
    });
    test('Total should be 5', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      expect(result['total'],5);
    });
    

    test('Total plus Undefined should match list length ', () {
      Map<String,int> result = SOLTrackCalculator.analyzeTrackingsByRating(trackings);
      int sum = result['total'] + result['undefined'];
      expect(sum,trackings.length);
    });
  });
}
