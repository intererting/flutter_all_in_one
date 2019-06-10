import 'package:flutter/material.dart';

class ClipView extends StatefulWidget {
  @override
  _ClipViewState createState() => _ClipViewState();
}

class _ClipViewState extends State<ClipView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 240,
            height: 240,
            color: Colors.yellow,
            child: ClipOval(
              child: Center(
                child: SizedBox(
                  width: 220,
                  height: 220,
                  child: ClipRect(
                    child: Container(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
