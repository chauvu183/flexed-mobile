import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dart:developer' as developer;


class StudentListDropDown extends StatefulWidget {
  @override
  _StudentListDropDownState createState() => _StudentListDropDownState();
}

class _StudentListDropDownState extends State<StudentListDropDown> {
  var selectedClass, selectedStudent;
  //List<String> list =["Computer Science", "German", "Math"];
  //SOLTrackRepository repo = SOLTrackRepository();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<FlexClassRepository>(context).index(),
      builder: (context, snapshot){
        return DropdownButton(
          items: _buildClassList(snapshot.data),
          onChanged: null,);
 
       
    /*     return DropdownButton(
          items: list
          .map((value) => DropdownMenuItem(
                   child: Text(
                   value,
                   style: TextStyle(color: Color(0xff11b719)),
                   ),
                   value: value,
                   ))
                   .toList(),
          onChanged: (value) { 
             print('$value');
                      setState(() {
                        selectedClass = value;
                      });
           },
           value: selectedClass,
           hint: Text(
             'Choose Class'
           ),
        ); */
      }
    );
  }

    _buildClassList(_classes) {
     List<DropdownMenuItem> classes = [];
      if(!_classes.hasData){
          Text('Loading');
        }else{
          _classes.data.forEach((_class){
            classes.add(
                 DropdownMenuItem(
                child: Text(
                  _class.title,
                ),
                value: "${_class.title}",
            )
            );
          });
            
          }

    return classes;
  }
}