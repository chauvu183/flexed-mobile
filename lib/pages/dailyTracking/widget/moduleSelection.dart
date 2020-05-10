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

  SOLTrackingForm({Key key, this.tracking,this.onDelete}) : super(key: key);
  @override
  _SOLTrackingFormState createState() {
    return _SOLTrackingFormState(this.tracking);
    }
}

class _SOLTrackingFormState extends State<SOLTrackingForm> {
  SOLTrack _tracking;
  _SOLTrackingFormState(SOLTrack track){
    _tracking = track;
  }

  List<String> subjects = [ "Deutsch" ,"Englisch", "Mathematik"];
  String dropdownValue =  "Deutsch";
  final form = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
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
                        initialValue: "1",
                        onSaved: (val) => _tracking.lessonNumber = int.parse(val),
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
                              value: dropdownValue,
                
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
                                  _tracking.subject = SubjectType(title: dropdownValue);
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
              SheetButton(_tracking)
          ]
        ),
      ) 
      );

  }

}

class SheetButton extends StatefulWidget {
    SOLTrack tracking;
    SheetButton(this.tracking);
    
  _SheetButtonState createState() { 
    return _SheetButtonState(this.tracking);
  }
}
class _SheetButtonState extends State<SheetButton> {
  bool checkingValid = false;
  bool success = false;

  SOLTrackRepository _repo;
  SOLTrack _tracking;

  _SheetButtonState(SOLTrack tracking){
      _tracking = tracking;
  }

  _saveTracking() {
    _repo.create(
      SOLTrack(
        student: _tracking.student,
        date:    DateTime.now(),
        lessonNumber: _tracking.lessonNumber,
        subject: _tracking.subject
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return !checkingValid
        ? MaterialButton(
            color: Colors.grey[800],
            onPressed: (){},
            child: Text(
              'Save Tracking',
              style: TextStyle(color: Colors.white),
            ),
          )
        : !success
            ? CircularProgressIndicator()
            : Icon(
                Icons.check,
                color: Colors.green,
              );
  }
}

