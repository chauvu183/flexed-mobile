import 'package:flutter/material.dart';

abstract class IChartInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
          child: SizedBox(
            width: MediaQuery.of(context).copyWith().size.width - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: declareChildren(context),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> declareChildren(BuildContext context) => List();
}
