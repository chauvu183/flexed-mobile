import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/moduleSelection.dart';
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
        (it) => it.solTracking == _solTracking,
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
        solTracking: _solTracking,
        student: _student,
        lessonNumber: currentLessonCount,
        onDelete: () => _onDelete(_solTracking),
      ));
    });
    
  }

    ///on save forms
  _onSave() {
    if (soltrackingFormList.length > 0) {
        var data = soltrackingFormList.map((it) => it.solTracking).toList();
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
  }

   // builds a list of ListTile elements to display in the ListView below
  _buildListTiles() {
    List<ListTile> tiles = List();

    for(int i = 0; i < solEntries.length; i++) {
      tiles.add(ListTile(title: Text(solEntries[i].subject.toString())));
    }
    return tiles;
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
                      child: soltrackingFormList.length <= 0
                      ? Center(child: Text("Keine SOL Trackings"))
                      : ListView.builder(
                        addAutomaticKeepAlives: true,
                        itemCount: soltrackingFormList.length,
                        itemBuilder: (_,i) => soltrackingFormList[i])
                       )
                      ),
                      ]
                  );
            },
            ),
            ),
             Padding(
                padding: EdgeInsets.all(12),
                child:  Container(
                        child: SizedBox(
                        height: 100.0, 
                        child: ListView(
                            children: _buildListTiles(),
                          ),
                          )
                          )
              ) 
              ]
           
            ),
            Positioned(
              top: 480,
              left: 320,
              child: FloatingActionButton(
                heroTag: "btn1",
                child: Icon(Icons.add),
                onPressed: _onAddForm)
              ),
                 Positioned(
              top: 480,
              left: 50,
              child: FloatingActionButton(
                child: Icon(Icons.save),
                  heroTag: "btn2",
                onPressed: _onSave())
              )   
        ],
        ),
    );


  }
}