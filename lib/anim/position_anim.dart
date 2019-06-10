import 'package:flutter/material.dart';

void main() {
  runApp(TestAnim());
}

class TestAnim extends StatefulWidget {
  @override
  _TestAnimState createState() => _TestAnimState();
}

class _TestAnimState extends State<TestAnim> with TickerProviderStateMixin {
  AnimationController _controller;
  AnimationController _controllerA;

  Animation<RelativeRect> animation;
  Animation<int> testAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 0.0,
      vsync: this,
    );

    _controllerA = AnimationController(
      duration: const Duration(milliseconds: 300),
      value: 0.3,
      vsync: this,
    );

//    CurvedAnimation curvedAnimation =
//        CurvedAnimation(curve: Curves.easeIn, parent: _controllerA);
//    testAnimation = IntTween(begin: 0, end: 300).animate(_controllerA);
    testAnimation = _controllerA.drive(IntTween(begin: 0, end: 300));

    animation = _controller.drive(RelativeRectTween(
      begin: RelativeRect.fromLTRB(
        0.0,
        0.0,
        0.0,
        0.0,
      ),
      end: const RelativeRect.fromLTRB(100.0, 100.0, 100.0, 100.0),
    ));

    Future.delayed(Duration(seconds: 2), () {
      print('delayed');
      setState(() {
//        _controllerA.value = 0.5;
        _controllerA.fling(velocity: 2.0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: 300,
                height: 300,
                child: Text("${testAnimation.value}"),
              ),
              PositionedTransition(
                rect: animation,
                child: GestureDetector(
                  onTap: () {
//                    _controllerA.fling(velocity: 2.0);
                    _controllerA.value = 0.5;
//                    _controller.value = 0.5;
                    _controller.fling(velocity: 1.0);
                  },
                  child: Container(
                    color: Colors.blue,
                    width: 100,
                    height: 100,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
