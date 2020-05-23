import 'package:flexed_mobile/pages/analyze/analyze.dart';
import 'package:flexed_mobile/pages/dailyTracking/dailyTracking.dart';
import 'package:flexed_mobile/pages/feedback/feedback.dart';
import 'package:flexed_mobile/pages/solTrackingHomepage/solTrackingHomepage.dart';
import 'package:flutter/material.dart';

class BottomNavButton extends StatelessWidget {
  final IconData icon;
  // final String label;
  final bool selected;
  final double iconSize = 36;
  final int tab;
  final Function(Widget, int) callback;
  // Coloring
  final Color currentColor = Color(0xFF14BD9C);
  final Color mainColor = Colors.black;

  BottomNavButton({
    this.icon,
    // this.label,
    this.selected,
    this.callback,
    this.tab,
  });

  @override
  Widget build(BuildContext context) {
    Color color;
    color = selected ? currentColor : mainColor;
    
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        switch (tab) {
          case 1:
            this.callback(DailyTracking(), 1);
            break;
          case 2:
            this.callback(FeedbackView(), 2);
            break;
          case 3:
            this.callback(Analyze(), 3);
            break;
          default:
            this.callback(SolTrackingHome(), 0);
        }
      },
      child: Icon(
        icon,
        color: color,
        size: iconSize,
      ),
    );
  }
}

// MaterialButton(
//                 minWidth: 40,
//                 onPressed: () {
//                   setState(() {
//                     currentScreen = SolTrackingHome();
//                     currentTab = 0;
//                   });
//                 },
//                 child: BottomNavButton(
//                   icon: Icons.home,
//                   // label: 'Home',
//                   selected: currentTab == 0,
//                 ),
//               ),
