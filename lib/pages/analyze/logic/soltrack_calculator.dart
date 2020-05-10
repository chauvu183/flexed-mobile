import 'dart:collection';

import 'package:flexed_mobile/types/enums/rating.dart';

import '../../../models/soltrack.dart';

class SOLTrackCalculator {

  static Map<String,int> analyzeTrackingsBySOL(List<SOLTrack> trackings) {
    int german = 0;
    int english = 0;
    int math = 0;
    int total = 0;
    Map<String,int> result = HashMap();
    
    for (var track in trackings) {
      switch (track.subject.title.toLowerCase()) {
        case  'deutsch':
          german++;
          break;
        case  'englisch':
          english++;
          break;
        case  'mathematik':
          math++;
          break;
      }
      total++;
    }
    result.putIfAbsent('deutsch', () => german);
    result.putIfAbsent('englisch', () => english);
    result.putIfAbsent('mathematik', () => math);
    result.putIfAbsent('total', () => total);
    return result;
  }

  static Map<Rating,int> analyzeTrackingsByRating(List<SOLTrack> trackings) {
    int bad = 0;
    int quitebad = 0;
    int average = 0;
    int quitegood = 0;
    int good = 0;
    int total = 0;

    Map<Rating,int> result = HashMap();
    
    for (var track in trackings) {
      switch (track.rating) {
        case Rating.UNDEFINED:
          total--;
          break;
        case Rating.BAD:
          bad++;
          break;
        case Rating.QUITEBAD:
          quitebad++;
          break;
        case Rating.AVERAGE:
          average++;
          break;
        case Rating.QUITEGOOD:
          average++;
          break;
        case Rating.GOOD:
          average++;
          break;
      }
      total++;
    }
    result.putIfAbsent(Rating.BAD, () => bad);
    result.putIfAbsent(Rating.QUITEBAD, () => quitebad);
    result.putIfAbsent(Rating.AVERAGE, () => average);
    result.putIfAbsent(Rating.QUITEGOOD, () => quitegood);
    result.putIfAbsent(Rating.GOOD, () => good);
    
    return result;
  }

}