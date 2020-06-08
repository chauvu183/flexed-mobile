import 'package:flutter/material.dart';

class BarAnimation extends StatefulWidget {
  final Widget child;

  BarAnimation({this.child});
  @override
  _BarAnimationState createState() => _BarAnimationState();
}

class _BarAnimationState extends State<BarAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
  

  _heightAnimation = new Tween<double>(begin: 0.4, end: 1.0).animate(new CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  _controller.addListener(() {
    this.setState(() {
      
    });
  });
  _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * _heightAnimation.value,
      child: widget.child,
    );
  }
}
