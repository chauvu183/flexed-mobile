
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/pages/feedback/widgets/flexclass_list/widgets/date_selection.dart';
import 'package:flexed_mobile/pages/feedback/widgets/student_carousel/student_carousel.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  List<Widget> _buildClassList(_classes) {
    List<Widget> list = [];

    if (_classes == null) {
      return list;
    }

    _classes.forEach((_class) { 
      list.add(
        FutureBuilder(
          future: Provider.of<SOLTrackRepository>(context).byStudents(_class.getMembers()),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container(
                height: 2,
                child: LinearProgressIndicator(value: null)
              );
            }
            
            // filter current date
            List<SOLTrack> trackings = snapshot.data;
            if (trackings != null) {
              trackings = snapshot.data.where((tracking) => tracking.date.difference(_selectedDate).inDays == 0).toList();
            }
            

            return ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.group), 
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
              title: Text(_class.title),
              trailing: Container(
                child: _buildClassOpenTrackingsCount(trackings),
              ),
              subtitle: _buildClassSubtitle(trackings),
              onTap: () => _goToClassDetails(_class),
            );
          }
        )
      );
    });

    return list;
  }


  Widget _buildClassSubtitle(List<SOLTrack> trackings) {
    if (trackings == null) {
      // "reserve" space for text while still loading
      return Container();
    }

    if (trackings.length < 1) {
      return Text('Keine Aufgaben');
    } else {
      return Text(trackings.length.toString() + ' Aufgaben');
    }
  }


  Widget _buildClassOpenTrackingsCount(List<SOLTrack> trackings) {
    if (trackings == null || trackings.length < 1) {
      return Container(width: 1,);

    } else {
      // filter only "open" trackings (no feedback yet)
      List<SOLTrack> openTrackings = trackings.where((tracking) => tracking.rating == null || tracking.rating == Rating.UNDEFINED).toList();

      if (openTrackings.length < 1) {
        return Container(
          child: Icon(Icons.done),
        );
      }

      return Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            openTrackings.length.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      );
    }
  }


  _goToClassDetails(_class) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StudentCarousel( flexClass: _class, selectedDate: _selectedDate,))).then((value) => setState(() => {}));
  }

}