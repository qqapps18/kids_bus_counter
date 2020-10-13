import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: KidBusCounter(title: 'Flutter Demo Home Page'),
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
  String imagebacground =  'images/schoolbuilding.png';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      imagebacground = 'images/childenterbus.png';
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      if(_counter > 0) {
      _counter--;
      if(_counter == 0){
        imagebacground =  'images/schoolbuilding.png';
      } else {
        imagebacground = 'images/kidexitbus.png';
      }}
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
                child: Image.asset(imagebacground,
                scale: 2,
                alignment:Alignment.topCenter ,),

              ),
            ),

            Text(
              'Kid Bus Counter',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton:
      Padding(
        padding: const EdgeInsets.fromLTRB(40, 25, 25, 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween ,
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
