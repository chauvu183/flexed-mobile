import 'dart:collection';

import '../../../models/soltrack.dart';

class SOLTrackCalculator {

  static Map<String,int> analyzeTrackings(List<SOLTrack> trackings) {
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

}