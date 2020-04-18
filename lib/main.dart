import 'package:flexed_mobile/api/repository/flexclass_mock_repository.dart';
import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/student_mock_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/pages/home.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        // Values and classes provided here are exposed
        // to the entire app. We can use this to publish
        // our services to all widgets where needed!
        Provider<StudentRepository>(
          create: (context) => new StudentMockRepository(),
        ),

        Provider<FlexClassRepository>(
          create: (context) => new FlexClassMockRepository(),
        ),

      ],

      // The children of the MultiProvider has access to
      // all provided values listed above
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,

            backgroundColor: Color(0xFFFFFBE6),

            primaryColorBrightness: Brightness.dark,
            primaryColor: Color(0xFF5E5E5E),
            primaryColorLight: Color(0xFFF3F3F3),
            primaryColorDark: Color(0xFF000000),

            cursorColor: Color(0xFFBC0000),
            accentColor: Color(0xFFBC0000),
            errorColor: Color(0xFFBC0000),

            textTheme: TextTheme(
              bodyText1: TextStyle(color: Colors.black),
              bodyText2: TextStyle(color: Colors.black),

              headline6: TextStyle(color: Colors.black),
            )
          ),
          home: Home(),
        )
    );
  }
}