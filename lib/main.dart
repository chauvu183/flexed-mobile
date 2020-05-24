import 'package:flexed_mobile/api/repository/flexclass_repository.dart';
import 'package:flexed_mobile/api/repository/mock/flexclass_mock_repository.dart';
import 'package:flexed_mobile/api/repository/mock/soltrack_mock_repository.dart';
import 'package:flexed_mobile/api/repository/mock/student_mock_repository.dart';
import 'package:flexed_mobile/api/repository/soltrack_repository.dart';
import 'package:flexed_mobile/api/repository/student_repository.dart';
import 'package:flexed_mobile/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(FlexedMobile());
}

class FlexedMobile extends StatelessWidget {

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

        Provider<SOLTrackRepository>(
          create: (context) => new SOLTrackMockRepository(),
        ),

      ],

      // The children of the MultiProvider has access to
      // all provided values listed above
      child: MaterialApp(
          title: 'Flutter Demo',

          localizationsDelegates:  [
            GlobalMaterialLocalizations.delegate,
          ],

          supportedLocales: [
            const Locale('de'),
          ],

          theme: ThemeData(
            brightness: Brightness.light,

            backgroundColor: Color(0xFFFFFBE6),

            primaryColorBrightness: Brightness.dark,
            primaryColor: Color(0xFF14BD9C),
            primaryColorLight: Color(0xFFCCF2E9),
            primaryColorDark: Color(0xFF14BD9C),
            

            accentColorBrightness: Brightness.light,
            accentColor: Color(0xFF33D97D),
            errorColor: Color(0xFFBC0000),

            // Breaks some of the layouts right now;
            // use this locally for now when designing.
            // You may need to quit your app and rebuild
            // completely before this takes effect.
            // fontFamily: 'Montserrat',

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