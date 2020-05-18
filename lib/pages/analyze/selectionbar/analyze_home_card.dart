import 'package:flutter/material.dart';

class AnalyzeHomeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Padding(
            padding: EdgeInsets.only(left: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Icon(
                    Icons.assessment,
                    size: 132,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2),
                  child: Text('Wähle eine Klasse',
                      style: Theme.of(context).textTheme.headline6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
