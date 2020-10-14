import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

void main() {
  runApp(KidBusControl());
}

class KidBusControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: KidBusCounter(title: 'Student Bus Control'),
    );
  }
}

class KidBusCounter extends StatefulWidget {
  KidBusCounter({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _KidBusCounterState createState() => _KidBusCounterState();
}

class _KidBusCounterState extends State<KidBusCounter> {
  String imagebacground = 'images/schoolbuilding.png';
  int _counter = 0;
  String message = "No Kid's in the Bus";
  var messprt = "No Kid's in the Bus";


  DateTime date = DateTime.now();


  void _incrementCounter() {
    setState(() {
      imagebacground = 'images/childenterbus.png';
      messprt = _counter.toString();
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
        if (_counter == 0) {
          messprt = message;
          imagebacground = 'images/schoolbuilding.png';
        } else {
          messprt = _counter.toString();
          imagebacground = 'images/kidexitbus.png';
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
              child: Container(
                height: 200,
                width: 200,
                child: Image.asset(
                  imagebacground,
                  scale: 2,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Text(DateFormat.yMMMd().format(date)),
            Text(
              'Kid Bus Counter',
              style: TextStyle(
                fontSize: 25,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$messprt',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(40, 25, 25, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.arrow_circle_up),
              backgroundColor: Colors.green,
            ),
            FloatingActionButton(
              onPressed: _decreaseCounter,
              tooltip: 'Decrease',
              child: Icon(Icons.arrow_circle_down),
              backgroundColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
