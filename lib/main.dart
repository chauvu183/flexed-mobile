import 'package:flexed_mobile/api/repository/student_mock_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'dart:developer' as developer;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [

          // Values and classes provided here are exposed
          // to the entire app. We can use this to publish
          // our services to all widgets where needed!
          Provider<StudentRepository>(
            create: (context) => new StudentMockRepository(),
          )

        ],

        child: MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              brightness: Brightness.light,

              backgroundColor: Color.fromRGBO(0xFF, 0xFB, 0xE6, 1.0),

              primaryColorBrightness: Brightness.dark,
              primaryColor: Color.fromRGBO(0x5E, 0x5E, 0x5E, 1.0),
              primaryColorLight: Color.fromRGBO(0xF3, 0xF3, 0xF3, 1.0),
              primaryColorDark: Color.fromRGBO(0x00, 0x00, 0x00, 1.0),

              cursorColor: Color.fromRGBO(0xBC, 0x00, 0x00, 1.0),
              accentColor: Color.fromRGBO(0xBC, 0x00, 0x00, 1.0),
              errorColor: Color.fromRGBO(0xBC, 0x00, 0x00, 1.0),

              textTheme: TextTheme(
                bodyText1: TextStyle(color: Colors.black),
                bodyText2: TextStyle(color: Colors.black),

            headline6: TextStyle(color: Colors.black),
          )
        ),
        home: Home()
      )
    );
  }
}

