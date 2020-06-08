import 'package:flutter/material.dart';

class ClassListInfoCard extends StatelessWidget {
  Size size;
  final List<Color> colors = [
    Color(0xFF33D97D),
    Color(0xFF14BD9C),
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: size.height * 0.20,
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: colors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xFFFFFBB28),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 150,
                  child: Image.asset(
                    "images/teacher.png",
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Klasse",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontWeight: FontWeight.w800, fontSize: 53),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
