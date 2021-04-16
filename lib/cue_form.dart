import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

// final prefs = await SharedPreferences.getInstance();


class Manager {

}

enum EmotionalState { 
  Depressed,
  Horny,
  Monke
}

class Cue {
  DateTime date;
  String place;
  EmotionalState emotionalState;
  String activity;
  List<String> people;

  save() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/counter.txt');
  }
}

class CueForm extends StatefulWidget {
  @override
  CueFormState createState() {
    return CueFormState();
  }
}

class CueFormState extends State<CueForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  final _isFilled_Time = TextEditingController();
  final _isFilled_Place = TextEditingController();
  final _isFilled_EmotionalState = TextEditingController();
  final _isFilled_Activity = TextEditingController();
  final _isFilled_People = TextEditingController();

  checkTextFieldEmptyOrNot(){
    // Creating 3 String Variables.
    String timeField,placeField,emotionalStateField,activityField,peopleField ;
    // Getting Value From Text Field and Store into String Variable
    timeField = _isFilled_Time.text;
    placeField = _isFilled_Place.text;
    emotionalStateField = _isFilled_EmotionalState.text;
    activityField = _isFilled_Activity.text;
    peopleField = _isFilled_People.text;
    // Checking all TextFields.
    if(peopleField == '' && placeField == '' && emotionalStateField == '')
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('Text Field is empty, Please Fill All Data');
 
    }else{
 
      // Put your code here, which you want to execute when Text Field is NOT Empty.
      print('Not Empty, All Text Input is Filled.');
    }
    
  }

  void showField(field) {
    setState(() => {
      // field = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //* Time
              Card(
                color: Colors.white70,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text("Time",)),
                          Expanded(
                            child: TextField(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Visibility (
                // placeField: _isFilled_Place,
                child: Card(
                  color: Colors.white70,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(child: Text("Place",)),
                            Expanded(
                              child: TextField(
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //* Place
              
              
              //* Emotions
              Card(
                color: Colors.white70,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text("Emotional state",)),
                          Expanded(
                            child: TextField(
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              //* Activity
              Card(
                color: Colors.white70,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text("Last activity",)),
                          Expanded(
                            child: TextField(
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              
              //* People
              Card(
                color: Colors.white70,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(child: Text("Who you were with",)),
                          Expanded(
                            child: TextField(
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              //* Submit button
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    // if (_formKey.currentState.validate()) {
                    //   // If the form is valid, display a snackbar. In the real world,
                    //   // you'd often call a server or save the information in a database.
                    // }
                    // check if all fields are not empty
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                  },
                  child: Text('Submit'),
                ),
              ),
            ],
          ),
        )
      )
    );
  }
}
