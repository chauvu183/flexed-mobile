import 'package:flexed_mobile/api/mocking/fixtures/fixtures.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/rating_sheet.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';

class MockClassRepository extends Mock implements FlexClassRepository {}
class MockStudentRepository extends Mock implements StudentRepository {}
class MockTrackingRepository extends Mock implements SOLTrackRepository {}


void main() {
  List<SOLTrack> testTrackings = Fixtures.trackings;

  Map<Rating, IconData> ratingIconMap = {
    Rating.BAD:       Icons.sentiment_very_dissatisfied,
    Rating.QUITEBAD:  Icons.sentiment_dissatisfied,
    Rating.AVERAGE:   Icons.sentiment_neutral,
    Rating.QUITEGOOD: Icons.sentiment_satisfied,
    Rating.GOOD:      Icons.sentiment_very_satisfied,
  };

  _testRatingSelection(WidgetTester tester, SOLTrack tracking, Rating rating) async {
    print('Test feedback sheet can update tracking rating to: ' + rating.toString());

    await tester.tap(find.byIcon(ratingIconMap[rating]));
    await tester.pump();

    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    // ensure tracking was updated
    expect(tracking.rating, rating);

    // mock repository must have updated test data
    expect(testTrackings[0].rating, rating);
  }

  testWidgets('Test feedback rating bottom sheet', (WidgetTester tester) async {
    // final classRepo = MockClassRepository();
    // final studentRepo = MockStudentRepository();
    final trackingRepo = MockTrackingRepository();
    final tracking = testTrackings[0];

    when(trackingRepo.update(tracking)).thenAnswer((_) async {
      // Return null to prevent Navigator stack pop
      return null;
    });

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          Provider<SOLTrackRepository>(
            create: (context) => trackingRepo,
          ),
        ], 
        child: MaterialApp(home: Scaffold(
            body: RatingSheet(tracking)
          ),
        ),
      )
    );

    print('Test feedback sheet has five rating buttons, submit button');
    expect(find.byType(IconButton), findsNWidgets(5));
    expect(find.byType(RaisedButton), findsOneWidget);
    expect(tracking.rating, testTrackings[0].rating);


    await _testRatingSelection(tester, tracking, Rating.BAD);
    await _testRatingSelection(tester, tracking, Rating.GOOD);
    await _testRatingSelection(tester, tracking, Rating.AVERAGE);
    await _testRatingSelection(tester, tracking, Rating.QUITEBAD);
    await _testRatingSelection(tester, tracking, Rating.QUITEGOOD);
  });
}
