import 'package:flexed_mobile/api/mocking/fixtures/fixtures.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/pages/feedback/feedback.dart';
import 'package:flexed_mobile/shared/flex_class_list/flex_class_tile.dart';
import 'package:flexed_mobile/shared/flex_class_list_date_filter/date_selection.dart';
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

    // ... wait for class list rebuild
    await tester.pump();

    // ... wait for class assignment count rebuild
    await tester.pump();

    // check if date selection is initialized
    print('Test feedback view date selection was initialized correctly');
    expect(find.byType(DateSelection), findsNWidgets(1));
    expect(find.text(DateFormat('dd.MM.yyyy').format(DateTime.now())), findsOneWidget);

    // check whether classes have a list tile each
    print('Test feedback view has tile for each flex class');
    expect(find.byType(ListView), findsNWidgets(1));
    expect(find.byType(FlexClassTile), findsNWidgets(testClasses.length));


    // check whether date selection works
    await tester.tap(find.byIcon(Icons.chevron_right));

    // ... wait for date selection rebuild
    await tester.pump();

    // ... wait for class list rebuild
    await tester.pump();

    // ... wait for class assignment count rebuild
    await tester.pump();

    print('Test date selection correctly triggers filter');
    expect(find.text(DateFormat('dd.MM.yyyy').format(DateTime.now().add(Duration(days: 1)))), findsOneWidget);
    expect(find.text('Keine Aufgaben'), findsNWidgets(testClasses.length));
  });
}
