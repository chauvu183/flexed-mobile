import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import 'package:intl/intl.dart';

typedef OnDelete();

class SOLTrackingForm extends StatefulWidget {

  final SOLTrack tracking;
  final OnDelete onDelete;

  SOLTrackingForm({this.tracking,this.onDelete});
  @override
  _SOLTrackingFormState createState() {
    return _SOLTrackingFormState(this.tracking);
    }
    
}

class _SOLTrackingFormState extends State<SOLTrackingForm> {
  List<String> subjects = [ "Deutsch" ,"Englisch", "Mathematik","Geschichte"];
  String dropdownValue =  "Deutsch";

  SOLTrack _tracking;
  _SOLTrackingFormState(SOLTrack tracking){
    _tracking = tracking;
  }

  SOLTrackRepository _repo;
    // initialise the list of entries as empty
  List<SOLTrack> entries = List();

  // refreshes the trackings by fetching them from the repository
  _refreshTrackings() {
    _repo.index().then((trackings) => {
      setState(() => entries = trackings)
    });
  }

  _saveTracking() {
    if(widget.tracking.lessonNumber == null){
        widget.tracking.lessonNumber = 1;
    }else if(widget.tracking.subject == null){
        widget.tracking.subject = SubjectType(title: "Deutsch");
    }
    if(widget.tracking.date != null){
      _repo.update(
      SOLTrack(
        student: widget.tracking.student,
        date:    DateTime.now(),
        lessonNumber: widget.tracking.lessonNumber,
        subject: widget.tracking.subject,
      )
    ).then((_) => _refreshTrackings());
    }else{
      _repo.create(
      SOLTrack(
        student: widget.tracking.student,
        date:    DateTime.now(),
        lessonNumber: widget.tracking.lessonNumber,
        subject: widget.tracking.subject,
      )
    ).then((_) => _refreshTrackings());
    }

  }

  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _repo = Provider.of<SOLTrackRepository>(context);

    // refresh the tracking records on first render
  //  _refreshTrackings();

    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Form(
        key: form,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
              Padding(padding: EdgeInsets.all(10),
                  child:  Text("SOL Tracking",
                    style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 20 )),
                  ),
              Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                    TextFormField(
                        initialValue: widget.tracking.lessonNumber.toString(),
                        onSaved: (val) => widget.tracking.lessonNumber = int.parse(val),
                        validator: (val) =>
                            val.length < 0 ? null : 'Lesson number is invalid',
                        decoration: InputDecoration(
                          labelText: 'Lesson Number',
                          hintText: 'Enter lesson number',
                          icon: Icon(Icons.timer),
                          isDense: true,
                        ),
                      ),
    
                     DropdownButton<String>(
                              icon: Icon(Icons.arrow_downward),
                              isExpanded: true,
                              value: widget.tracking.subject.title,
                
                              iconSize: 24,
                              elevation: 20,
                              style: TextStyle(
                                color: Colors.grey
                              ),
                              underline: Container(
                                height: 2,
                                color: Colors.grey,
                              ),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                  widget.tracking.subject = SubjectType(title: dropdownValue);
                                });
                              },
                              items: subjects
                                .map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value.toString()),
                                  );
                                })
                                .toList(),
                            )
                 ],
              ),
            RaisedButton(
            color: Colors.grey[800],
            onPressed: ()async {
              await Future.delayed(Duration(seconds: 1));
              Navigator.pop(context);
              _saveTracking();
              },
            child: Text(
              'Save Tracking',
              style: TextStyle(color: Colors.white),
            ),
          ), 
          ]
        ),
      ) 
      );
  }
}
