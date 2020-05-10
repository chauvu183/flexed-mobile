import 'package:flexed_mobile/pages/analyze/charts/ichart.dart';
import 'package:flutter/material.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/indicators/incicator_card_subject.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'widgets/bar_item.dart';

class SubjectChart extends IChart {
  final List<Color> colors = [
    Color(0xff0293ee),
    Color(0xfff8b250),
    Color(0xff5ac18e),
    Color(0xff808080),
  ];

  final Map<String, int> trackings;
  final IChartInfo chartInfo;

  final double _width = 50;

  SubjectChart({
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
          IndicatorSubjectCard(colors: colors),
        ],
    );
  }

  Widget buildChart(BuildContext context, Map<String, int> trackings) {
    double maxHeight = MediaQuery.of(context).size.height/2.5;
    List<BarItem> bars = [];

    double total = trackings['total'].toDouble()+trackings['undefined'].toDouble();
    double german = trackings['deutsch'].toDouble();
    double english = trackings['englisch'].toDouble();
    double math = trackings['mathematik'].toDouble();

    bars.add(BarItem(
      color: colors[0],
      width: _width,
      height: german / total * maxHeight,
      timesPicked: german.toInt(),
    ));
    bars.add(BarItem(
      color: colors[1],
      width: _width,
      height: english / total * maxHeight,
      timesPicked: english.toInt(),
    ));
    bars.add(BarItem(
      color: colors[2],
      width: _width,
      height: math / total * maxHeight,
      timesPicked: math.toInt(),
    ));
    bars.add(BarItem(
      color: colors[3],
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
