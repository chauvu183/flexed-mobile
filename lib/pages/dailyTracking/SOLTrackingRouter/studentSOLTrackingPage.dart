import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/bottomSheetWidget.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/moduleSelection.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/myFloatingActionButton.dart';
import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:developer';
import 'dart:convert';

class StudentSOLPage extends StatefulWidget {
  Student _student;
  StudentSOLPage(Student student){
      _student = student;
  }
  
  @override
  _StudentSOLPageState createState() => _StudentSOLPageState(_student);
}

class _StudentSOLPageState extends State<StudentSOLPage> {
  Student _student;
  _StudentSOLPageState(Student student){
    _student = student;
  }
  SOLTrackRepository _repo;
  List<SOLTrack> solEntries = List();

  var currentLessonCount = 0;


  Future<List<SOLTrack>> _getTrackings() {
    return Provider.of<SOLTrackRepository>(context).byStudent(_student);
  }

   void _refreshTrackings() {
    _repo.index().then((trackings) =>{
      setState(() => solEntries = trackings)
    });
  }

        ///on form user deleted
  _onDelete(SOLTrack _solTracking) {
       var find = solEntries.firstWhere(
        (it) => it == _solTracking,
        orElse: () => null,
      );
     // if (find != null) _repo.delete(solEntries.indexOf(find)).then((_) => _refreshTrackings());
  
  }



    // builds a list of ListTile elements to display in the ListView below
  _buildListTiles(List<SOLTrack> trackings) {
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
          subtitle: Text('Datum: ' + DateFormat('dd.MM.yyyy').format(tracking.date) + " \nUnterricht Stunde : " + tracking.lessonNumber.toString() ),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: (){},
            ),
          onTap: () {
              showModalBottomSheet(context: context, builder: (context) => SOLTrackingForm(tracking:tracking)).then((value) => {
              setState(() => null)
            });
          } )
      );
    });

    return list;
  }
  
  @override
  Widget build(BuildContext context) {
    _repo = Provider.of<SOLTrackRepository>(context);
    // refresh the tracking records on first render
    _refreshTrackings();
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
        Container(  
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
           ),
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12),
                child: InfoCard(student: _student),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: FutureBuilder(future: _getTrackings(),
                builder: (context,snapshot){
                return Row(
                  children: <Widget>[  
                    Expanded(
                       child: SizedBox(
                      height: 400.0,
                      child:ListView(
                          children: _buildListTiles(snapshot.data),
                        ),
                       )
                      ),
                      ]
                  );
            },
            ),
            )
            ]          
            ),
            Positioned(
              top: 490,
              left: 250,
              child:  FloatingActionButton(
                  onPressed: () {
                    SOLTrack tracking = new SOLTrack(student:_student,lessonNumber: 1,subject: SubjectType(title: "Deutsch"));
                    showModalBottomSheet(context: context, builder: (context) => SOLTrackingForm(tracking:tracking)).then((value) => {
                    setState(() => null)
                  });
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.red,
                ),
              ),
        ],
        ),
    );


  }
}