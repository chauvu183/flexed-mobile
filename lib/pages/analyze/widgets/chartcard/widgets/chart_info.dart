import 'package:flutter/material.dart';

class ChartInfo extends StatelessWidget {
  final String title;
  final int numberStudents;
  final int numberRatings;

  ChartInfo({@required this.title, this.numberStudents = 16, this.numberRatings = 82});

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Klasse: $title',
                  style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                Text('Schüler: $numberStudents'),
                // Text('Bewertungen: $numberRatings'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
