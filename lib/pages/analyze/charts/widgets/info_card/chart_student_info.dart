import 'package:flexed_mobile/pages/analyze/charts/widgets/info_card/ichart_info.dart';
import 'package:flexed_mobile/types/data/mail_type.dart';
import 'package:flutter/material.dart';

class ChartStudentInfo extends IChartInfo {
  final String fullName;
  final MailType mail;
  final int numberRatings;

  ChartStudentInfo({
    @required this.fullName,
    this.mail,
    this.numberRatings,
  });

  @override
  List<Text> declareChildren(BuildContext context) {
    return [
      Text(
        'Name: $fullName',
        style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      Text('Mail: ${mail.toString()}'),
      Text('Bewertungen: ${numberRatings.ceil()}'),
    ];
  }
}
