import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class HomeScreen extends StatefulWidget {

  final habits = ['Smoking', 'Coffee', 'Diareha'];

  HomeScreen();

  @override
  HomeScreenState createState() {
    return HomeScreenState(habits);
  }
}

class HomeScreenState extends State<HomeScreen> {

  var _habits;
  HomeScreenState(this._habits);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              for (var i in _habits) HabitButton(i),
              TextButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () => {},
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text('+', style: TextStyle(fontSize: 20)),
                )
              ),
              Spacer(),
              SizedBox(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  strokeWidth: 50,
                  value: 0.3,
                ),
                height: 250,
                width: 250,
              ),
              Spacer(),
            ],
          )
        ),
      );
  }

}