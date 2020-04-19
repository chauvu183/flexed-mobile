import 'package:flutter/material.dart';

import 'filter_button.dart';

class FilterBar extends StatefulWidget {
  @override
  _FilterBarState createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  List<String> flexClasses = ['Gesamt', 'F8', 'F9', 'F9+'];
  List<String> students = ['Anton Artig', 'Berta Böse', 'Carmen Cool'];
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
