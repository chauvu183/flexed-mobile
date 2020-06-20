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
      body: Center(
        child: Image.asset(
          'images/logo.png',
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
