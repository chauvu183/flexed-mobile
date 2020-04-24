

import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/rating_sheet.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {

  Student _student;

  StudentPage(Student student) {
    _student = student;
  }

  @override
  State<StatefulWidget> createState() {
    return _StudentPageState(_student);
  }

}


class _StudentPageState extends State<StudentPage> {

  Student _student;

  _StudentPageState(Student student) {
    _student = student;
  }


  Future<List<SOLTrack>> _getTrackings() {
    return Provider.of<SOLTrackRepository>(context).byStudent(_student);
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
          onTap: () => showModalBottomSheet(context: context, builder: (context) => RatingSheet(tracking)),
        ),
      );
    });

    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Card(
        elevation: 2,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(12.0),
              child: InfoCard(student: _student),
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
      )
    );
  }

}