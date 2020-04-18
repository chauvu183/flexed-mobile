import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'dart:developer' as developer;

import 'package:provider/provider.dart';
class StudentCarousel extends StatefulWidget {

  final FlexClass flexClass;

  StudentCarousel(this.flexClass);

  ActiveStudent createState() {
    return ActiveStudent(flexClass);
  }
}


class ActiveStudent extends State<StudentCarousel> {

  FlexClass flexClass;
  List<Student> _students;

  int _activeStudentIndex;

  ActiveStudent(this.flexClass) {
    _students = flexClass.getMembers();
    _activeStudentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(flexClass.title),
      ),
      body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: InfoCard(student: _getActiveStudent()),
            ),

            Padding(
              padding: EdgeInsets.all(12.0),
              child: Card(
                child: FutureBuilder(
                  future: _getTrackings(),
                  builder: (context, snapshot) {
                    if (snapshot.data == null || snapshot.data.length < 1) {
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Text('Keine Aufgaben zugewiesen.'),
                          ),
                        ],
                      );
                    }

                    return Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: _buildTrackingList(snapshot.data)
                      )
                    );
                }),
              )
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _nextStudent(),
        child: Icon(Icons.chevron_right),
        backgroundColor: Theme.of(context).accentColor,
        
      ),
    );
  }


  _nextStudent() {
    if (_activeStudentIndex >= (_students.length - 1)) {
      return null;
    }

    setState(() {
      _activeStudentIndex++;
    });
  }

  Student _getActiveStudent() {
    return _students[_activeStudentIndex];
  }

  Future<List<SOLTrack>> _getTrackings() {
    return Provider.of<SOLTrackRepository>(context).byStudents([_getActiveStudent()]);
  }


  _buildTrackingList(List<SOLTrack> trackings) {
    List<Widget> list = [];

    if (trackings == null) {
      return list;
    }

    trackings.forEach((tracking) { 
      list.add(
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.assignment), 
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          title: Text(tracking.subject.title),
          subtitle: Text('Begonnen: ' + DateFormat('dd.MM.yyyy').format(tracking.date)),
        ),
      );
    });

    return list;
  }
}