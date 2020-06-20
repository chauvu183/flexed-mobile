import 'package:flexed_mobile/pages/analyze/charts/widgets/chart-bars/subject_bar_item.dart';
import 'package:flutter/material.dart';

import '../charts/ichart.dart';
import '../charts/widgets/info_card/ichart_info.dart';

// subject chart is shown if analyzetype subject is chosen
class SubjectChart extends IChart {
  final List<Color> colors = [
    Color(0xFF33D97D),
    Color(0xFF14BD9C),
    Color(0xFF87CCBA),
    Color(0xFFFFBB28),
    Color(0xFFCCF2E9),
  ];

  final Map<String, int> trackings;
  final IChartInfo chartInfo;

  SubjectChart({
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
              alignment: Alignment.bottomRight,
              image: AssetImage(
                'images/background.png',
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
    List<SubjectBarItem> bars = [];

    // prepare the data to be shown in the chart
    double total = trackings['total'].toDouble() + trackings['undefined'].toDouble();
    double german = trackings['deutsch'].toDouble();
    double english = trackings['englisch'].toDouble();
    double math = trackings['mathematik'].toDouble();

    // build the bars 
    bars.add(SubjectBarItem(
      color: colors[0],
      height: german / total * maxHeight,
      timesPicked: german.toInt(),
      label: "Deutsch",
    ));
    bars.add(SubjectBarItem(
      color: colors[1],
      height: english / total * maxHeight,
      timesPicked: english.toInt(),
      label: "Englisch",
    ));
    bars.add(SubjectBarItem(
      color: colors[2],
      height: math / total * maxHeight,
      timesPicked: math.toInt(),
      label: "Mathe",
    ));
    bars.add(SubjectBarItem(
      color: colors[3],
      height: total / total * maxHeight,
      timesPicked: total.toInt(),
      label: "Gesamt",
    ));

    return Container(
      color: Colors.transparent,
      height: MediaQuery.of(context).copyWith().size.height / 2,
      width: MediaQuery.of(context).copyWith().size.width - 50,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: bars),
    );
  }
}
