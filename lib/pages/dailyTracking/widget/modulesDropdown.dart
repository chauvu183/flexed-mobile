import 'package:flutter/material.dart';

class SolTracking extends StatefulWidget {
  @override
  _SolTrackingState createState() => _SolTrackingState();
}

class _SolTrackingState extends State<SolTracking> {
  final List<String> subjects = ["Computer Science", "German", "Math"];
  String selectedSubject = "German";
  num number;

  @override
  Widget build(BuildContext context) {
        return Positioned(
      top: 380,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Stunde 1",style:TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
           // Text(selectedSubject, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900),)
          ],
              ),
              SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );

    _adddHourTracking(String selectedSubject){
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
}