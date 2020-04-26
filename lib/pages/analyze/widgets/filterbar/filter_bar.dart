import 'package:flutter/material.dart';

import './widgets/filter_button.dart';

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  static List<String> flexClasses = ['Gesamt', 'F8', 'F9', 'F9+'];
  static List<String> studentsF8 = ['Anton Artig', 'Berta Böse', 'Carmen Cool'];
  static List<String> studentsF9 = ['Detlef Diesig', 'Emilia Eifrig', 'Frederick Fuchsig'];
  static List<String> studentsF9plus = ['Günther Geizig', 'Harald Handzahm', 'Ina Intensiv'];
  List<String> students = studentsF8 + studentsF9 + studentsF9plus;
  List<String> dataOptions = ['Bewertung',];

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      elevation: 5,
      color: Theme.of(context).primaryColorLight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilterButton(
            hint: 'Klasse',
            options: flexClasses,
          ),
          // MyVerticalDivider(),
          FilterButton(
            hint: 'Schüler',
            options: students,
          ),
          Spacer(),
          FilterButton(hint: 'Datenanalyse', options: dataOptions),
        ],
      ),
    );
  }
} 
// class MyVerticalDivider extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(color: Theme.of(context).primaryColorDark, width: 0.5, height: 30.0,);
//   }
// }