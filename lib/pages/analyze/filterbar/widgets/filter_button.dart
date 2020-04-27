import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final String hint;
  final List<String> options;

  FilterButton({this.hint, this.options});

  @override
  _FilterButtonState createState() =>
      _FilterButtonState(hint: hint, options: options);
}

class _FilterButtonState extends State<FilterButton> {
  String dropdownValue;
  double dropDownFontSize = 16.0;
  String hint;
  List<String> options;
  _FilterButtonState({@required this.hint, @required this.options});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: DropdownButton<String>(
        hint: Text(
          hint,
          style: TextStyle(fontSize: dropDownFontSize, color: Theme.of(context).primaryColor),
        ),
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_drop_down,
          color: Theme.of(context).accentColor,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        underline: Container(
          height: 2,
          color: Theme.of(context).accentColor,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
            print('changed to $newValue');
          });
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(
                fontSize: dropDownFontSize,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
