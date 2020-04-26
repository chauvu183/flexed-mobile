import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/*
 * This view was created as a practical example of how to use the repositories
 * and providers. You can read more in the GitLab wiki at:
 * https://git.haw-hamburg.de/acm167/flexed-mobile/-/wikis/Architektur/Creating-an-expandable-list-with-the-existing-providers
 */

class RepoExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _RepoExampleState();
  }

}


class _RepoExampleState extends State<RepoExample> {

  // this variable holds the reference to the repository
  SOLTrackRepository _repo;

  // initialise the list of entries as empty
  List<SOLTrack> entries = List();

  // refreshes the trackings by fetching them from the repository
  _refreshTrackings() {
    _repo.index().then((trackings) => {
      setState(() => entries = trackings)
    });
  }

  // adds a new (static) SOLTrack record. This could be dynamic, of course!
  _addTracking() {
    _repo.create(
      SOLTrack(
        student: Student(firstName: 'Peter', lastName: 'Pan'),
        date:    DateTime.now(),
        lessonNumber: 1,
        subject: SubjectType(title: 'Deutsch')
      )
    ).then((_) => _refreshTrackings());
  }

  // builds a list of ListTile elements to display in the ListView below
  _buildListTiles() {
    List<ListTile> tiles = List();

    for(int i = 0; i < entries.length; i++) {
      tiles.add(ListTile(title: Text(entries[i].subject.title)));
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    // Save a reference to the needed repository in an instance variable
    // (makes the code a bit more readable)
    _repo = Provider.of<SOLTrackRepository>(context);

    // refresh the tracking records on first render
    _refreshTrackings();

    return Scaffold(
      appBar: AppBar(title: Text('Expandable list with repositories'),),
      body: ListView(
        children: _buildListTiles(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => setState(() => _addTracking()),
      ),
    );
  }
}