import 'package:flutter/material.dart';

import 'icon_title.dart';

// BASIC CHART INFO CARD
abstract class IChartInfo extends StatelessWidget {
  final List<Color> colors = [
    Color(0xFF33D97D),
    Color(0xFF14BD9C),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          child: SizedBox(
            width: MediaQuery.of(context).copyWith().size.width - 50,
            child: Column(
              children: [
                buildIconTitle(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: declareChildren(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // declare the row children based on chart type
  List<Widget> declareChildren(BuildContext context) => List();
  
  // build the icon and title based on chart type
  IconTitle buildIconTitle();
}
