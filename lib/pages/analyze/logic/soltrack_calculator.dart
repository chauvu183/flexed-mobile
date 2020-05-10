import 'dart:collection';

import 'package:flexed_mobile/types/enums/rating.dart';

import '../../../models/soltrack.dart';

class SOLTrackCalculator {

  static Map<String,int> analyzeTrackingsBySOL(List<SOLTrack> trackings) {
    int german = 0;
    int english = 0;
    int math = 0;
    int total = 0;
    int undefined = 0;
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
      track.rating == Rating.UNDEFINED ? undefined++ : total++;  
    }
    result.putIfAbsent('deutsch', () => german);
    result.putIfAbsent('englisch', () => english);
    result.putIfAbsent('mathematik', () => math);
    result.putIfAbsent('total', () => total);
    result.putIfAbsent('undefined', () => undefined);
    return result;
  }

  static Map<String,int> analyzeTrackingsByRating(List<SOLTrack> trackings) {
    int bad = 0;
    int quitebad = 0;
    int average = 0;
    int quitegood = 0;
    int good = 0;
    int total = 0;
    int undefined = 0;

    Map<String,int> result = HashMap();
    
    for (var track in trackings) {
      switch (track.rating) {
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
          quitegood++;
          break;
        case Rating.GOOD:
          good++;
          break;
        case Rating.UNDEFINED:
          undefined++;
          break;  
      }
      total = bad + quitebad + average + quitegood + good;
    }
    result.putIfAbsent("bad", () => bad);
    result.putIfAbsent("quitebad", () => quitebad);
    result.putIfAbsent("average", () => average);
    result.putIfAbsent("quitegood", () => quitegood);
    result.putIfAbsent("good", () => good);
    result.putIfAbsent("undefined", () => undefined);
    result.putIfAbsent("total", () => total);
    
    return result;
  }

}