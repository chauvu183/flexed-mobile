import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/moduleSelection.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/solDailyTracking.dart';

import 'package:flexed_mobile/shared/infocard/info_card.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'dart:developer';

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

    _repo.create(
        soltrackingFormList[soltrackingFormList.length-1].solTracking
      ).then((_) => _refreshTrackings());

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
              ]
           
            ),
            Positioned(
              top: 480,
              left: 300,
              child: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: _onAddForm)
              )
        ],
        ),
    );


  }
}