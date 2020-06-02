import 'package:flutter/material.dart';

import 'package:flexed_mobile/models/student.dart';
import 'package:flexed_mobile/shared/infocard/avatar.dart';

class InfoCard extends StatelessWidget {
  final Student student;

  InfoCard({@required this.student});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            children: <Widget>[
              Container(
                height: 80,
                child: Image(
                  fit: BoxFit.contain,
                  image: AssetImage(
                    'images/boyForPageStudent-01.png',
                  ),
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
                          fontWeight: FontWeight.w800, 
                          fontSize: 18),
                      ),
                    ]
                ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}