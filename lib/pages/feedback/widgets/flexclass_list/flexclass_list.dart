
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/pages/feedback/widgets/flexclass_list/widgets/date_selection.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/student_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as developer;

class FlexClassList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FlexClassListState();
  }
}


class _FlexClassListState extends State<FlexClassList> {

  DateTime _selectedDate = DateTime.now();

  _onDateChanged(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        DateSelection(
          initialDate: _selectedDate,
          onDateChanged: _onDateChanged,
        ),
        Flexible(
          child: FutureBuilder(
            future: Provider.of<FlexClassRepository>(context).index(),
            builder: (context, snapshot) {
              return ListView(
                children: _buildClassList(snapshot.data),
              );
            }
          ),
        ),
      ],
    );
  }

  _buildClassList(_classes) {
    List<Widget> list = [];

    if (_classes == null) {
      return list;
    }

    _classes.forEach((_class) { 
      list.add(
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.group), 
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          title: Text(_class.title),
          subtitle: _buildClassSubtitle(_class),
          onTap: () => _goToClassDetails(_class),
        ),
      );
    });

    return list;
  }


  _buildClassSubtitle(FlexClass flexClass) {
    return FutureBuilder(
      future: Provider.of<SOLTrackRepository>(context).byStudents(flexClass.getMembers()),
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data.length < 1) {
          return Text('Keine Aufgaben');
        }

        List<SOLTrack> trackings = snapshot.data;
        trackings = trackings.where((tracking) => tracking.date.difference(_selectedDate).inDays == 0).toList();

        return Text(trackings.length.toString() + ' Aufgaben');
      }
    );
  }


  _goToClassDetails(_class) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => StudentCarousel( flexClass: _class, selectedDate: _selectedDate,)));
  }

}