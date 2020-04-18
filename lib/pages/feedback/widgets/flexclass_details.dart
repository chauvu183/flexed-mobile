

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexClassDetails extends StatefulWidget {
  ActiveFlexClass createState() {
    return ActiveFlexClass();
  }
}


class ActiveFlexClass extends State<FlexClassDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('Klassenname'),
      ),
      body: Text('Details')
    );
  }
}