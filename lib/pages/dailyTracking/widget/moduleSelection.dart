import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/pages/dailyTracking/widget/solDailyTracking.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';

typedef OnDelete();

class SOLTrackingForm extends StatefulWidget {

  final SOLTrack solTracking;
  final Student student;

  final OnDelete onDelete;

  SOLTrackingForm({Key key, this.solTracking,this.student,this.onDelete}) : super(key: key);
  @override
  _SOLTrackingFormState createState() => _SOLTrackingFormState();
}

class _SOLTrackingFormState extends State<SOLTrackingForm> {
 

  List<String> subjects = [ "German" ,"English", "Math"];
  String dropdownValue =  "German";
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
            AppBar(
              leading: Icon(Icons.timer),
              elevation: 0,
              title: Text('Stunde '), // TODO : update the time
              backgroundColor: Colors.deepPurple,
              centerTitle: true,
              actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: widget.onDelete,
              )
              ],
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: DropdownButton<String>(
                      icon: Icon(Icons.arrow_downward),
                      isExpanded: true,
                      value: dropdownValue,
        
                      iconSize: 24,
                      elevation: 20,
                      style: TextStyle(
                        color: Colors.deepPurple
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                          widget.solTracking.subject = SubjectType(title: newValue);
                          widget.solTracking.date = DateTime.now();
                          widget.solTracking.lessonNumber = 1;
                          widget.solTracking.student = widget.student;
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
            )
        ]
      ) 
      );

  }

}