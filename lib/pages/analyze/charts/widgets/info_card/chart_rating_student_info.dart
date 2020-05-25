import 'package:flexed_mobile/types/enums/gender.dart';
import 'package:flutter/material.dart';

import './ichart_info.dart';
import '../../../../../types/enums/special_educational_needs.dart';
import 'icon_title.dart';

class ChartRatingStudentInfo extends IChartInfo {
  final String fullName;
  final SpecialEducationalNeeds specialEducationalNeeds;
  final int numberRatings;
  final Gender gender;

  ChartRatingStudentInfo({
    @required this.fullName,
    this.specialEducationalNeeds,
    this.numberRatings,
    this.gender,
  });

  @override
  List<Widget> declareChildren(BuildContext context) {
    return [
      Text('Bewertungen: ${numberRatings.ceil()}'),
    ];
  }

  Text _checkSpecialNeeds() {
     switch (specialEducationalNeeds) {
        case SpecialEducationalNeeds.GERMAN_AS_SECOND_LANGUAGE:
          return Text('Deutsch als Zweitsprache');
          break;
        case SpecialEducationalNeeds.SPECIAL_NEEDS:
         return Text('Förderbedarf');
        default:
           return Text("");
      }
  }
  IconTitle buildIconTitle() {
    String url = gender == Gender.MALE
        ? 'images/boyForPageStudent-01.png'
        : 'images/girlForPageClasses337x234.png';
        print(url);
    return IconTitle(
      url: url,
      title: fullName,
      needs: _checkSpecialNeeds(),
    );
  }
}
