
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/pages/feedback/widgets/flexclass_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as developer;

class FlexClassList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FlexClassListState();
  }
}


class FlexClassListState extends State<FlexClassList> {

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<FlexClassRepository>(context).index(),
      builder: (context, snapshot) {
        return ListView(
          children: _buildClassList(snapshot.data),
        );
      }
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
          subtitle: SOLTrackCount(_class),
          onTap: () => _goToClassDetails(_class),
        ),
      );
    });

    return list;
  }


  _goToClassDetails(_class) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => FlexClassDetails()));
  }

}


class SOLTrackCount extends StatefulWidget {
  FlexClass flexClass;

  SOLTrackCount(this.flexClass);

  SOLTrackCountState createState() {
    return SOLTrackCountState(flexClass);
  }
}

class SOLTrackCountState extends State<SOLTrackCount> {

  FlexClass flexClass;

  SOLTrackCountState(this.flexClass);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<SOLTrackRepository>(context).byStudents(flexClass.getMembers()),
      builder: (context, snapshot) {
        if (snapshot.data == null || snapshot.data.length < 1) {
          return Text('Keine Aufgaben');
        }

        return Text(snapshot.data.length.toString() + ' Aufgaben');
      }
    );
  }
}