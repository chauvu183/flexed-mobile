

import 'package:flexed_mobile/models/flexclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlexClassTile extends StatelessWidget {
  
  final FlexClass flexClass;

  final Widget trailing;
  final Widget subtitle;
  
  final Function onTap;

  FlexClassTile({ @required this.flexClass, this.trailing, this.subtitle, this.onTap });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)), 
          color: Theme.of(context).primaryColorLight
        ),
        height: 75,
        child: InkWell(
          onTap: () => this.onTap(flexClass),

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          splashColor: Theme.of(context).primaryColor,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Icon(Icons.group, size: 32, color: Colors.black,),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              flexClass.title, 
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          this.subtitle,
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15),
                    child: this.trailing,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}