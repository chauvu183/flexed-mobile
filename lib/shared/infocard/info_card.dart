import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flutter/material.dart';

import 'package:flexed_mobile/models/student.dart';

class InfoCard extends StatelessWidget {
  final List<Color> colors = [
    Color(0xFF33D97D),
    Color(0xFF14BD9C),
  ];
  final Student student;

  InfoCard({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(student.gender == Gender.MALE
                      ? 'images/boyForPageStudent-trimmed.png'
                      : 'images/girlForPageClassesTrimmed.png'),
                ),
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          student.getFullName(),
                          style: Theme.of(context).textTheme.headline6.copyWith(
                              fontWeight: FontWeight.w800, fontSize: 18),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
