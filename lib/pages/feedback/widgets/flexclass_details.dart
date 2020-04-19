

import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class FlexClassDetails extends StatefulWidget {

  final FlexClass flexClass;

  FlexClassDetails(this.flexClass);

  ActiveFlexClass createState() {
    return ActiveFlexClass(flexClass);
  }
}


class ActiveFlexClass extends State<FlexClassDetails> {

  FlexClass flexClass;

  ActiveFlexClass(this.flexClass);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(flexClass.title),
      ),
      body: FutureBuilder(
        future: Provider.of<SOLTrackRepository>(context).byStudents(flexClass.getMembers()),
        builder: (context, snapshot) {
        return ListView(
          children: _buildTrackingList(snapshot.data)
        );
      })
    );
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
          subtitle: Text(tracking.student.firstName + ' ' + tracking.student.lastName),
        ),
      );
    });

    return list;
  }
}