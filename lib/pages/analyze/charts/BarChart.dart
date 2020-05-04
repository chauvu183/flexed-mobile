import 'package:flutter/material.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/incicator_card.dart';
import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'widgets/bar_item.dart';

class BarChart extends StatelessWidget {
  static const Color colorGerman = Color(0xff0293ee);
  static const Color colorEnglish = Color(0xfff8b250);
  static const Color colorMath = Color(0xff5ac18e);
  static const Color colorTotal = Colors.red;

  final Map<String, int> trackings;
  final IChartInfo chartInfo;

  BarChart({
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
          IndicatorCard(),
        ],
    );
  }

  Widget buildChart(BuildContext context, Map<String, int> trackings) {
    // double maxHeight = 300;
    double maxHeight = MediaQuery.of(context).size.height/2.5;
    List<BarItem> bars = [];

    double total = trackings['total'].toDouble();
    double german = trackings['deutsch'].toDouble();
    double english = trackings['englisch'].toDouble();
    double math = trackings['mathematik'].toDouble();

    bars.add(BarItem(
      color: colorGerman,
      height: german / total * maxHeight,
      timesPicked: german.toInt(),
    ));
    bars.add(BarItem(
      color: colorEnglish,
      height: english / total * maxHeight,
      timesPicked: english.toInt(),
    ));
    bars.add(BarItem(
      color: colorMath,
      height: math / total * maxHeight,
      timesPicked: math.toInt(),
    ));
    bars.add(BarItem(
      color: colorTotal,
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
