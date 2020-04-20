import 'package:flutter/material.dart';
class StudentProfile extends StatefulWidget {
  @override
  _StudentProfileState createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  bool available = false;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      child: Container(
        margin: const EdgeInsets.all(20),
        height: 260,
        width: MediaQuery.of(context).size.width * 0.90,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Student Information",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                        Text("Chau Vu",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30) ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("Class A", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),  
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text("Anwesendheit:"),
                               Checkbox(
                                  value: available,
                                  onChanged: (bool value) {
                                    setState(() {
                                      available = value;
                                    });
                                  },
                                )
                            ],
                          ),   
                    ]
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