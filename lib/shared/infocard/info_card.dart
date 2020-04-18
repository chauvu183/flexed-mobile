import 'package:flutter/material.dart';

import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/shared/infocard/avatar.dart';
import 'package:intl/intl.dart';

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

            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text(student.getFullName(), style: Theme.of(context).textTheme.headline6),
                  ),
                  Padding(
                    padding: EdgeInsets.all(2),
                    child: Text('Geburtstag: ' + DateFormat('dd.MM.yyyy').format(student.birthday), style: Theme.of(context).textTheme.subtitle1),
                  ),
                ]
              ),
            ),

          ],
        ),
      ),
    );
  }
}
