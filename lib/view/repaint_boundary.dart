import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(RepaintBoundaryTest());

class RepaintBoundaryTest extends StatefulWidget {
  @override
  _RepaintBoundaryTestState createState() => _RepaintBoundaryTestState();
}

class _RepaintBoundaryTestState extends State<RepaintBoundaryTest> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: <Widget>[
            RepaintBoundary(
              child: TestViewA(),
            ),
            RepaintBoundary(
              child: TestViewB(),
            ),
            TestViewC(),
            RaisedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text('RaisedButton in tree'),
            )
          ],
        ),
      ),
    );
  }
}

class TestViewA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('TestViewA  build');
    return Container();
  }
}

class TestViewB extends StatefulWidget {
  @override
  _TestViewBState createState() => _TestViewBState();
}

class _TestViewBState extends State<TestViewB> {
  @override
  Widget build(BuildContext context) {
    print('TestViewB build');
    return Container(
      child: RaisedButton(
        onPressed: () {
          setState(() {});
        },
        child: Text('TestViewB button'),
      ),
    );
  }
}

class TestViewC extends StatefulWidget {
  @override
  _TestViewCState createState() => _TestViewCState();
}

class _TestViewCState extends State<TestViewC> {
  @override
  Widget build(BuildContext context) {
    print('TestViewC build');
    return Container();
  }
}
