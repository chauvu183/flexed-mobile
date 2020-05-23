// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flexed_mobile/api/mocking/fixtures/fixtures.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/mock/flexclass_mock_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/main.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/feedback.dart';
import 'package:flexed_mobile/pages/feedback/widgets/flexclass_list/flexclass_list.dart';
import 'package:flexed_mobile/pages/feedback/widgets/flexclass_list/widgets/date_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockClassRepository extends Mock implements FlexClassRepository {}
class MockStudentRepository extends Mock implements StudentRepository {}
class MockTrackingRepository extends Mock implements SOLTrackRepository {}


void main() {

  List<FlexClass> testClasses = Fixtures.classes;
  List<Student> testStudents = Fixtures.students;
  List<SOLTrack> testTrackings = Fixtures.trackings;

  testWidgets('Test feedback class list view', (WidgetTester tester) async {
    final classRepo = MockClassRepository();
    // final studentRepo = MockStudentRepository();
    final trackingRepo = MockTrackingRepository();

    when(classRepo.index()).thenAnswer((_) async {
      return testClasses;
    });

    testClasses.forEach((flexclass) {
      when(trackingRepo.byStudents(flexclass.getMembers())).thenAnswer((_) async {
        return testTrackings;
      });
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<FlexClassRepository>(
            create: (context) => classRepo,
          ),

          Provider<SOLTrackRepository>(
            create: (context) => trackingRepo,
          ),
        ], 
        child: MaterialApp(home: FeedbackView()),
      )
    );

    await tester.pump();

    await tester.pump();

    // check if date selection is initialized
    expect(find.byType(DateSelection), findsNWidgets(1));
    expect(find.text(DateFormat('dd.MM.yyyy').format(DateTime.now())), findsOneWidget);

    // check whether classes have a list tile each
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.byType(ListTile), findsNWidgets(testClasses.length));


    await tester.tap(find.byIcon(Icons.chevron_right));
    await tester.pump();

    expect(find.text(DateFormat('dd.MM.yyyy').format(DateTime.now().add(Duration(days: 1)))), findsOneWidget);

  });
}
