import 'package:flexed_mobile/pages/analyze/charts/ichart.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/indicators/indicator_card_rating.dart';
import 'package:flutter/material.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'widgets/bar_item.dart';

class RatingChart extends IChart {

  static const List<Color> colors = [
    Color(0xffe50000),
    Color(0xffec8227),
    Color(0xffe5e500),
    Color(0xff5ac18e),
    Color(0xff065535),
    Color(0xff808080),
  ];

  final Map<String, int> trackings;
  final IChartInfo chartInfo;
  final double _width = 35;

  RatingChart({
    this.trackings,
    this.chartInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          chartInfo,
          buildChart(context, trackings),
          Divider(),
          IndicatorRatingCard(colors: colors, width: _width,),
        ],
    );
  }

  Widget buildChart(BuildContext context, Map<String, int> trackings) {
    double maxHeight = MediaQuery.of(context).size.height/2.5;
    List<BarItem> bars = [];

    double bad = trackings['bad'].toDouble();
    double quitebad = trackings['quitebad'].toDouble();
    double average = trackings['average'].toDouble();
    double quitegood = trackings['quitegood'].toDouble();
    double good = trackings['good'].toDouble();
    double total = trackings['total'].toDouble();
   
    bars.add(BarItem(
      color: colors[0],
      width: _width,
      height: bad / total * maxHeight,
      timesPicked: bad.toInt(),
    ));
    bars.add(BarItem(
      color: colors[1],
      width: _width,
      height: quitebad / total * maxHeight,
      timesPicked: quitebad.toInt(),
    ));
    bars.add(BarItem(
      color: colors[2],
      width: _width,
      height: average / total * maxHeight,
      timesPicked: average.toInt(),
    ));
    bars.add(BarItem(
      color: colors[3],
      width: _width,
      height: quitegood / total * maxHeight,
      timesPicked: quitegood.toInt(),
    ));
    bars.add(BarItem(
      color: colors[4],
      width: _width,
      height: good / total * maxHeight,
      timesPicked: good.toInt(),
    ));
    bars.add(BarItem(
      color: colors[5],
      width: _width,
      height: total / total * maxHeight,
      timesPicked: total.toInt(),
    ));

    return Container(
        color: Colors.white,
        height: MediaQuery.of(context).copyWith().size.height/2,
        width: MediaQuery.of(context).copyWith().size.width - 50,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: bars),
    );
  }
}
