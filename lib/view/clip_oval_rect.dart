import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(ClipTest());

class ClipTest extends StatefulWidget {
  @override
  _ClipTestState createState() => _ClipTestState();
}

class _ClipTestState extends State<ClipTest> {
  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SizedBox(
          width: 200,
          height: 200,
          child: ClipOval(
            child: Center(
              child: SizedBox(
                width: 200,
                height: 200,
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
    );
  }
}
