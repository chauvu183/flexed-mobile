import 'package:flutter/material.dart';

import '../charts/ichart.dart';
import '../charts/widgets/info_card/ichart_info.dart';
import 'widgets/chart-bars/rating_bar_item.dart';

class RatingChart extends IChart {
  static const List<Color> colors = [
    Color(0xFF33D97D),
    Color(0xFF14BD9C),
    Color(0xFFCCF2E9),
    Color(0xFF87CCBA),
    Color(0xFF20CCBF),
    Color(0xFFFFBB28),
  ];

  final Map<String, int> trackings;
  final IChartInfo chartInfo;

  RatingChart({
    this.trackings,
    this.chartInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              alignment: Alignment.bottomLeft,
              image: AssetImage(
                'images/background-03-02.png',
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            chartInfo,
            buildChart(context, trackings),
          ],
        ),
      ],
    );
  }

  Widget buildChart(BuildContext context, Map<String, int> trackings) {
    double maxHeight = MediaQuery.of(context).size.height / 2.5;
    List<RatingBarItem> bars = [];

    double bad = trackings['bad'].toDouble();
    double quitebad = trackings['quitebad'].toDouble();
    double average = trackings['average'].toDouble();
    double quitegood = trackings['quitegood'].toDouble();
    double good = trackings['good'].toDouble();
    double total = trackings['total'].toDouble();

    bars.add(RatingBarItem(
        color: colors[0],
        height: bad / total * maxHeight,
        timesPicked: bad.toInt(),
        icon: Icons.sentiment_very_dissatisfied));
    bars.add(RatingBarItem(
      color: colors[1],
      height: quitebad / total * maxHeight,
      timesPicked: quitebad.toInt(),
      icon: Icons.sentiment_dissatisfied,
    ));
    bars.add(RatingBarItem(
      color: colors[2],
      height: average / total * maxHeight,
      timesPicked: average.toInt(),
      icon: Icons.sentiment_neutral,
    ));
    bars.add(RatingBarItem(
      color: colors[3],
      height: quitegood / total * maxHeight,
      timesPicked: quitegood.toInt(),
      icon: Icons.sentiment_satisfied,
    ));
    bars.add(RatingBarItem(
      color: colors[4],
      height: good / total * maxHeight,
      timesPicked: good.toInt(),
      icon: Icons.sentiment_very_satisfied,
    ));
    bars.add(RatingBarItem(
      color: colors[5],
      height: total / total * maxHeight,
      timesPicked: total.toInt(),
      icon: Icons.functions,
    ));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.transparent,
      height: MediaQuery.of(context).copyWith().size.height / 2,
      width: MediaQuery.of(context).copyWith().size.width - 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bars,
      ),
    );
  }
}
