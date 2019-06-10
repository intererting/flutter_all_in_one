import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AnimDrive());
}

class AnimDrive extends StatefulWidget {
  @override
  _AnimDriveState createState() => _AnimDriveState();
}

class _AnimDriveState extends State<AnimDrive>
    with SingleTickerProviderStateMixin {
  Animation<double> driveAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    driveAnimation = _controller.drive(Tween<double>(begin: 0.0, end: 300.0));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
                left: 100.0,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                )),
            GestureDetector(
              onTap: () {
                setState(() {
                  _controller.value = 0.5;
//                  _controller.fling(velocity: 1.0);
                });
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                color: Colors.blue,
              ),
            ),
            Container(
              color: Colors.red,
              width: 200.0,
              height: 200.0,
              child: Text('${driveAnimation?.value}'),
              margin: EdgeInsets.only(left: 100.0, top: 100.0),
            )
          ],
        ),
      ),
    );
  }
}
