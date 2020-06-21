import 'package:flutter/material.dart';

// the dropdown button for the rating type (string)
class AnalyzeTypeButton<String> extends StatefulWidget {
  final Color btnColor = Color(0xFF14BD9C);
  final Function(String) callBackSelectedAnalyzeType;
  final String analyzeType;

  AnalyzeTypeButton({
    this.callBackSelectedAnalyzeType,
    this.analyzeType,
  });

  @override
  _AnalyzeTypeButtonState createState() => _AnalyzeTypeButtonState();
}

class _AnalyzeTypeButtonState extends State<AnalyzeTypeButton> {
  String selected;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: widget.btnColor,
          style: BorderStyle.solid,
          width: 2,
        ),
      ),
      child: DropdownButton<String>(
        value: widget.analyzeType,
        hint: Text("Auswertung"),
        icon: Icon(
          Icons.arrow_drop_down,
          color: widget.btnColor,
        ),
        iconSize: 28,
        isDense: true,
        isExpanded: true,
        underline: SizedBox(),
        style: TextStyle(color: Theme.of(context).primaryColorDark),
        onChanged: (String newType) {
          setState(() {
            widget.callBackSelectedAnalyzeType(newType);
            selected = newType;
          });
        },
        items: [
          DropdownMenuItem<String>(
            value: 'Fach',
            child: Text('Fach'),
          ),
          DropdownMenuItem<String>(
            value: 'Bewertung',
            child: Text('Bewertung'),
          ),
        ],
      ),
    );
  }
}
