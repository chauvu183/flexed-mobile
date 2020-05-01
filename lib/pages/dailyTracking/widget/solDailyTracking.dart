import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/types/data/subject_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flexed_mobile/models/soltrack.dart';
import './moduleSelection.dart';

class SolTracking extends StatefulWidget {
  @override
  _SolTrackingState createState() => _SolTrackingState();
}

class _SolTrackingState extends State<SolTracking> {
  Student _student; 
  List<SOLTrack> solTrackingList = [];
  List<String> selectedSubjects =[];

  Student student;
  DateTime date;
  int lessonNumber;
  SubjectType subject;


  Icon floatingIcon = new Icon(Icons.add);


  final List<String> subjects = ["English", "German", "Math"];
  String selectedSubject = "German";
  num number;
  
  Future<List<SOLTrack>> _getTrackings() {
    return Provider.of<SOLTrackRepository>(context).byStudent(_student);
  } 

  void onDelete(int index){
    setState(() {
      solTrackingList.removeAt(index);
    });
  }

  void onAddSelection(){
    SOLTrack solTrack = new SOLTrack(student: student, date: date, lessonNumber: lessonNumber, subject: subject);
    setState(() {
      solTrackingList.add(solTrack);
    });
  }

  @override
  Widget build(BuildContext context) {
   // return FutureBuilder(future: Provider.of<FlexClassRepository>(context).index(),,)
         return Positioned(
      top: 340,
      child: Container(
        margin: EdgeInsets.all(20),
        height: 300,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0, // has the effect of softening the shadow
              spreadRadius: 2.0, // has the effect of extending the shadow
              offset: Offset(
                5.0, // horizontal, move right 10
                5.0, // vertical, move down 10
              ),
            )
          ],
            ),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "SOL Tracking ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: solTrackingList.length,
                  itemBuilder: (_ , i) => SOLTrackingForm(),
                  
                 padding: const EdgeInsets.all(20.0),
                 //children: _getListings(),
              ),
              ),
              FloatingActionButton(
                  onPressed: onAddSelection,
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green,)
              
/*               Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppBar(
                  leading: Icon(Icons.edit),
                  title: Text('Stunde'),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed:(){} ,
                      )
                  ]),
                    DropdownButton<String>(
                    value: selectedSubject,
                    onChanged: (value){
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    items: subjects.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                  IconButton(
                  
                    icon: Icon(Icons.add),
                    onPressed:(){} ,
                  )

                  
             /*      Text("Stunde 1",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                   SizedBox(
                    width: 40,
                  ),
                  DropdownButton<String>(
                    value: selectedSubject,
                    onChanged: (value){
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    items: subjects.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ), */

                
      
          ],
              ), */
/*               SizedBox(
                height:10,
              ),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[ 
                  Text("Stunde 2",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    width: 40,
                  ),
                     DropdownButton<String>(
                    value: selectedSubject,
                    onChanged: (value){
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    items: subjects.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                ],
              ) */
            ],
          ),
        ),
      ),
    );
    
  }
  

  List<Widget> _getListings() {
    List listings = new List<Widget>();
    int i = 0;
    
      listings.add(      
        <Widget>[
                  AppBar(
                  leading: Icon(Icons.edit),
                  title: Text('Stunde'),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed:(){} ,
                      )
                  ]),
                    DropdownButton<String>(
                    value: selectedSubject,
                    onChanged: (value){
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    items: subjects.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
                  IconButton(
                  
                    icon: Icon(Icons.add),
                    onPressed:(){} ,
                  )
          ]
      );
  
     return listings;
  } 


      List<Widget>_adddHourTracking(String selectedSubject){
      List<Widget> dynamicList = [];
      dynamicList.add(
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.assignment), 
            backgroundColor: Theme.of(context).primaryColorLight,
          ),
          title: Text("Stunden" + number.toString()),
          subtitle:  DropdownButton<String>(
                    value: selectedSubject,
                    onChanged: (value){
                      setState(() {
                        selectedSubject = value;
                      });
                    },
                    items: subjects.map<DropdownMenuItem<String>>((value){
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                  ),
        ),
        
      );
      return dynamicList;
    }
}