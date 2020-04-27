import 'package:flutter/material.dart';

class ChartInfo extends StatelessWidget {
  final String title;
  final int numberStudents;
  final double numberRatings;

  static const Color colorOne = Color(0xff0293ee);
  static const Color colorTwo = Color(0xfff8b250);
  static const Color colorThree = Color(0xff5ac18e);

  ChartInfo({
    @required this.title,
    this.numberStudents,
    this.numberRatings,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Text('Bewertungen: ${numberRatings.ceil()}'),                          
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
