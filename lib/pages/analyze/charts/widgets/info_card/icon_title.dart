import 'package:flutter/material.dart';

class IconTitle extends StatelessWidget {
  final String title;
  final String url;
  final Text needs;
  final int numberStudents;

  IconTitle({this.title, this.url, this.needs, this.numberStudents});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 65,
            width: 100,
            child: url == ""
                ? Placeholder()
                : Image.asset(
                    url,
                    fit: BoxFit.contain,
                  ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    needs ?? Text('Schüler: $numberStudents'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
