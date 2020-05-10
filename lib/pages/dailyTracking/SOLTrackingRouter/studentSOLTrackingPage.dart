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
  SOLTrack _tracking;
  _StudentSOLPageState(Student student){
    _student = student;
  }


  List<SOLTrackingForm> soltrackingFormList = List();
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
  void _onDelete(SOLTrack _solTracking) {
    setState(() {
      currentLessonCount = currentLessonCount - 1;
      var find = soltrackingFormList.firstWhere(
        (it) => it.tracking == _solTracking,
        orElse: () => null,
      );
      if (find != null) soltrackingFormList.removeAt(soltrackingFormList.indexOf(find));
    });
  }

  ///on add form
  void _onAddForm() {
    setState(() {
      var _solTracking = SOLTrack();
      currentLessonCount = currentLessonCount + 1 ;
      soltrackingFormList.add( SOLTrackingForm(
        tracking: _solTracking,
        onDelete: () => _onDelete(_solTracking),
      ));
    });
    
  }

    ///on save forms
  _onSaveToRepo() { 
    if (soltrackingFormList.length > 0) {
        var data = soltrackingFormList.map((it) => it.tracking).toList();
            for(var i=0; i< data.length;i++){
                _repo.create(
                    SOLTrack(
                  student: data[i].student,
                  date:    data[i].date,
                  lessonNumber: data[i].lessonNumber,
                  subject: data[i].subject
                )
                ).then((_) => _refreshTrackings());
            }      
    }
   // log(soltrackingFormList.toString());
  }

   // builds a list of ListTile elements to display in the ListView below
  _buildSOLListForm(List<SOLTrack> trackings) {

    if (trackings == null) {
      return  soltrackingFormList;
    }

    trackings.forEach((element) {
      soltrackingFormList.add(
        SOLTrackingForm(
        tracking: element,
        onDelete: () => _onDelete(element),)
      );
    });
    return soltrackingFormList;
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
          subtitle: Text('Begonnen: ' + DateFormat('dd.MM.yyyy').format(tracking.date)),
          trailing: Icon(Icons.delete),
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
              top: 480,
              left: 320,
              child:  FloatingActionButton(
                  onPressed: () {
                    SOLTrack tracking = new SOLTrack(student:_student );
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