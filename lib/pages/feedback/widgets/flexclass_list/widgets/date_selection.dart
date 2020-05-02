import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class DateSelection extends StatefulWidget {
  final DateTime initialDate;
  final Function onDateChanged;

  DateSelection({ this.initialDate, this.onDateChanged});

  @override
  State<StatefulWidget> createState() {
    return _DateSelectionState(initialDate: initialDate != null ? initialDate : DateTime.now(), onDateChanged: onDateChanged);  
  }

}



class _DateSelectionState extends State<DateSelection> {

  Function onDateChanged;

  DateTime _selectedDate;

  DateTime _minYear = DateTime(2020);
  DateTime _maxYear = DateTime(2050);

  DateFormat _format = DateFormat('dd.MM.yyyy');

  _DateSelectionState({ @required DateTime initialDate, this.onDateChanged }) {
    _selectedDate = initialDate;
  }

  _setDate(DateTime newDate) {
    setState(() {
      _selectedDate = new DateTime(newDate.year, newDate.month, newDate.day);

      this.onDateChanged.call(this._selectedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 50, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  customBorder: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.chevron_left)
                  ),
                  onTap: () => _setDate(_selectedDate.subtract(new Duration(days: 1))),
                ),
                InkWell(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                    child: Container(
                      child: Text(_format.format(_selectedDate), style: Theme.of(context).textTheme.subtitle1),
                    ),
                  ),
                  onTap: () => {
                    showDatePicker(
                      context: context, 
                      initialDate: 
                      _selectedDate, 
                      firstDate: _minYear, 
                      lastDate: _maxYear, 
                      helpText: 'Datum der Erfassung auswählen',
                      locale: Locale('de'),
                    ).then((value) => {
                      if (value != null) {
                        _setDate(value)
                      }
                    })
                  },
                ),
                InkWell(
                  customBorder: CircleBorder(),
                  child: Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.chevron_right)
                  ),
                  onTap: () => _setDate(_selectedDate.add(new Duration(days: 1))),
                ),
              ],
            )
          ),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey[300]))
          ),
        );
  }

}