import 'package:flexed_mobile/pages/feedback/widgets/flexclass_list.dart';
import 'package:flutter/material.dart';

class FeedbackView extends StatefulWidget {
  @override
  FeedbackState createState() => FeedbackState();
}

class FeedbackState extends State<FeedbackView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Feedback'),
      ),
      body: FlexClassList()
    );
  }
}