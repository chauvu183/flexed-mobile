import 'package:flutter/material.dart';

class SolTracking extends StatefulWidget {
  @override
  _SolTrackingState createState() => _SolTrackingState();
}

class _SolTrackingState extends State<SolTracking> {
  final List<String> subjects = ["Computer Science", "German", "Math"];
  String selectedSubject = "German";

  @override
  Widget build(BuildContext context) {
        return Positioned(
      top: 380,

      child: Container(
        margin: EdgeInsets.all(20),
        height: 200,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
            color: Colors.lightBlue, borderRadius: BorderRadius.circular(20)),
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
  }
}