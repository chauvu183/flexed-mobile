import 'package:flutter/material.dart';

import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/shared/infocard/avatar.dart';

class InfoCard extends StatelessWidget {
  final Student student;

  InfoCard({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(12.0),
      color: Theme.of(context).backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Avatar(initials: student.getInitials()),
            ),
            Card(child: Text('Test'),),
          ],
        ),
      ),
    );
  }
}
