import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/types/enums/rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class FlexClassList extends StatefulWidget {

  final Function onClassSelected;
  final Function dateFilterFactory;

  FlexClassList({ this.onClassSelected, this.dateFilterFactory });

  @override
  State<StatefulWidget> createState() {
    return _FlexClassListState(
      onClassSelected: this.onClassSelected,
      dateFilterFactory: dateFilterFactory
    );
  }
}


class _FlexClassListState extends State<FlexClassList> {

  Function onClassSelected;
  Function dateFilterFactory;

  DateTime _filterDate;

  _FlexClassListState({ this.onClassSelected, this.dateFilterFactory });

  @override
  Widget build(BuildContext context) {
    if (this.dateFilterFactory != null) {
      _filterDate = this.dateFilterFactory();
    }

    return FutureBuilder(
      future: Provider.of<FlexClassRepository>(context).index(),
      builder: (context, snapshot) {
        return ListView(
          children: _buildClassList(snapshot.data),
        );
      }
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
            if (trackings != null && _filterDate != null) {
              trackings = snapshot.data.where((tracking) => tracking.date.difference(_filterDate).inDays == 0).toList();
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
              onTap: () => this.onClassSelected(_class),
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

}