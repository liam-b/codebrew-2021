import 'package:codebrew_2021/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        scaffoldBackgroundColor: Colors.blueGrey[50],
        primarySwatch: Colors.red
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
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            foregroundColor: MaterialStateProperty.all(Colors.black),
          ),
          onPressed: () => {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
              return CueForm(habitName);
              }),
            )
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(habitName, style: TextStyle(fontSize: 20)),
          )
        )
      )
      
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  final habits = ['Smoking', 'Coffee', 'Diareha'];

  final _screens = [
    HomeScreen(),
    Text('data'),
    Center(child: Icon(Icons.ac_unit))
  ];

  var _screenIndex = 0;

  void getHabitButtons() {
    int x = 0;
    for (int i; i < habits.length; i+=2) {
      HabitButton(i.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        Spacer(),
        Center(child: Text('Habit Tracker', style: TextStyle(fontSize: 20),),),
        Spacer(),
      ],),
      body: _screens[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _screenIndex, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.accessibility_sharp),
           label: 'Progress',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'Profile'
         )
        ],
        onTap: (index){
          setState(() {
            _screenIndex = index;
          });
        },
     ),

    );
  }
}

/* 

As a ___ I want to be able to ___ so that I can ___

*/
