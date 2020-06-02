import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/widgets/rating_sheet.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class StudentPage extends StatefulWidget {

  final Student student;
  final DateTime filteredDate;

  StudentPage({ @required this.student, @required this.filteredDate });

  @override
  State<StatefulWidget> createState() {
    return _StudentPageState(this.student, this.filteredDate);
  }

}


class _StudentPageState extends State<StudentPage> {

  Student _student;
  DateTime _date;

  _StudentPageState(Student student, DateTime date) {
    _student = student;
    _date = date;
  }


  Future<List<SOLTrack>> _getTrackings() async {
    List<SOLTrack> _trackings;

    await Provider.of<SOLTrackRepository>(context).byStudent(_student).then((trackings) => {
      _trackings = trackings.where((tracking) => tracking.date.difference(_date).inDays == 0).toList()
    });

    return _trackings;
  }


  _ratingSentiment(Rating rating) {
    switch(rating) {
      case Rating.GOOD:
        return Icon(Icons.sentiment_very_satisfied);
      
      case Rating.QUITEGOOD:
        return Icon(Icons.sentiment_satisfied);

      case Rating.AVERAGE:
        return Icon(Icons.sentiment_neutral);

      case Rating.QUITEBAD:
        return Icon(Icons.sentiment_dissatisfied);

      case Rating.BAD:
        return Icon(Icons.sentiment_very_dissatisfied);

      default:
        return Icon(Icons.error);
    }
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
          subtitle: Text('${tracking.lessonNumber}. Unterrichtsstunde'),
          trailing: tracking.rating == Rating.UNDEFINED ? null : _ratingSentiment(tracking.rating),
          onTap: () => showModalBottomSheet(context: context, builder: (context) => RatingSheet(tracking)).then((value) => {
            setState(() => null)
          }),
        ),
      );
    });

    return list;
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      child: Column(
        children: <Widget>[
          InfoCard(student: _student),

          Flexible(
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
                    children: _buildTrackingList(snapshot.data)
                  )
                );
            }),
          ),
        ],
      ),
    );
  }

}