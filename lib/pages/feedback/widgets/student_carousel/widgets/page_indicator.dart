import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';



class PageIndicator extends StatelessWidget {

  final int maxPages;
  final int currentPage;

  PageIndicator(this.maxPages, this.currentPage);

  List<Widget> _buildBullets() {
    List<Widget> bullets = List();

    for(int i = 0; i < maxPages; i++) {
      Widget bullet;

      if (i == currentPage) {
        bullet = Padding(padding: EdgeInsets.all(5), child: Container(width: 12, height: 12, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),),);
      } else {
        bullet = Padding(padding: EdgeInsets.all(5), child: Container(width: 9, height: 9, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey),),);
      }

      bullets.add(bullet);
    }

    return bullets;
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: _buildBullets()
    );
  }

}
