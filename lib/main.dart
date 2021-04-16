import 'package:flutter/material.dart';

import 'cue_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pi in Disguise',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Pie In Disguise'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class HabitButton extends StatelessWidget {
  final String habitName;

  HabitButton(this.habitName);
  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Padding(
      padding: EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
            // Respond to button press
        },
        child: Text(habitName, style: TextStyle(fontSize: 25)),
      )
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: <Widget>[
              // ElevatedButton(
              //   onPressed: () {
              //       // Respond to button press
              //   },
              //   child: Text("I FEEL LIKE SMOKING", style: TextStyle(fontSize: 25)),
              // ),
              // SizedBox(height: 10),
              HabitButton("Smoking"),
              HabitButton("Coffee"),
              HabitButton("Coffee"),
              HabitButton("Coffee"),
              HabitButton("Coffee"),
              HabitButton("Coffee"),
              HabitButton("Coffee")
            ],
          )
        ),
      ),
      floatingActionButton: Container(
        // child: Icon(Icons.airline_seat_individual_suite_sharp),
          width: 70.0,
          height: 70.0,
        child: FloatingActionButton(
          tooltip: 'Increment',
          shape: new CircleBorder(),
          elevation: 0.0,
          child: Icon(
            Icons.add,
            color: Colors.blue,
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
              return CueForm();
            }),
          )
        },
        )
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Color(0xFFFF6B13D),
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

/* 

As a ___ I want to be able to ___ so that I can ___

*/
