import 'package:flutter/material.dart';

class SolTrackingHome extends StatefulWidget {

  SolTrackingHome();
  @override
  _SolTrackingHomeState createState() => _SolTrackingHomeState();
}

class _SolTrackingHomeState extends State<SolTrackingHome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlexEd mobile'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: ClipOval(
                child: Container(
                  color: Color.fromRGBO(0, 0, 0, 0.2),
                  padding: EdgeInsets.all(10),
                  child: Image.asset('images/logo512x512.png'),
                ),
              ),
            ),
          ),
          Text(
            'Willkommen bei FlexEd!',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
