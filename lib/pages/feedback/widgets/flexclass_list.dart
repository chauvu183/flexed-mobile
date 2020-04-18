
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
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
          subtitle: Text('Keine offenen Aufgaben'),
          onTap: () => _goToClassDetails(_class),
        ),
      );
    });

    return list;
  }


  _goToClassDetails(_class) {
    developer.log('Test! Ich habe Klasse ' + _class.title + ' angeklickt!');
  }

}