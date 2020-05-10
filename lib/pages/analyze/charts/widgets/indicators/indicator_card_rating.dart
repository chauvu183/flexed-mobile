import 'package:flutter/material.dart';

class IndicatorRatingCard extends StatelessWidget {
  final List<Color> colors;
  final double width;
  final double iconSize = 38;

  IndicatorRatingCard({this.colors, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).copyWith().size.width - 50,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width,
            child: Icon(
              Icons.sentiment_very_dissatisfied,
              color: colors[0],
              size: iconSize,
            ),
          ),
          Container(
            width: width,
            child: Icon(
              Icons.sentiment_dissatisfied,
              color: colors[1],
              size: iconSize,
            ),
          ),
          Container(
            width: width,
            child: Icon(
              Icons.sentiment_neutral,
              color: colors[2],
              size: iconSize,
            ),
          ),
          Container(
            width: width,
            child: Icon(
              Icons.sentiment_satisfied,
              color: colors[3],
              size: iconSize,
            ),
          ),
          Container(
            width: width,
            child: Icon(
              Icons.sentiment_very_satisfied,
              color: colors[4],
              size: iconSize,
            ),
          ),
          Container(
            width: width,
            child: Icon(
              Icons.functions,
              color: colors[5],
              size: iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
