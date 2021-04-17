import 'dart:convert';
import 'dart:io';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'cue.dart';


class CueForm extends StatefulWidget {

  String cueName;
  CueForm(this.cueName);

  @override
  CueFormState createState() {
    return CueFormState(cueName);
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

  Cue currentCue = new Cue(DateTime.now(), "Location", EmotionalState.Monke, "Work", ["Josh", "Parsa"]);

  String cueName;
  CueFormState(this.cueName);

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
    if(timeField == '' || placeField == '')
    {
      // Put your code here which you want to execute when Text Field is Empty.
      print('still some to fill');
 
    }else{
 
      // Put your code here, which you want to execute when Text Field is NOT Empty.
      print('all filled');
    }
    
  }

  void showField(field) {
    setState(() => {
      // field = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final test = Cue(DateTime.now(), "Location", EmotionalState.Monke, "Work", ["Josh", "Parsa"]);
    final encoded = jsonEncode(test.toJson());
    debugPrint(encoded);
    final decoded = jsonDecode(encoded);
    final deserialized = Cue.fromJson(decoded);
    debugPrint(jsonEncode(deserialized.toJson()));

    deserialized.save();

    // Build a Form widget using the _formKey created above.
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(cueName, style: TextStyle(fontSize: 25),)
              ),

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
                            child: TextButton(
                              onPressed: () {
                                Future<void> _selectDate(BuildContext context) async {
                                  final TimeOfDay pickedDate = await showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now()
                                  );
                                  if (pickedDate != null) {
                                    setState(() {
                                      currentCue.time = pickedDate;
                                    });
                                  }
                                  // if (pickedDate != null && pickedDate != currentDate)
                                  //   setState(() {
                                  //     currentDate = pickedDate;
                                  //   });
                                }
                                _selectDate(context);
                              },
                              child: Text(currentCue.time.format(context),),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //* Place
              Card(
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
                              controller: _isFilled_Place,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                              controller: _isFilled_EmotionalState,
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
                              controller: _isFilled_Activity,
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
                            // child: TextField(
                            //   controller: _isFilled_People,
                            // ),
                            child: DropDownField(
                              // value: "hi",
                              // icon: Icon(Icons.map),
                              required: true,
                              // hintText: 'Choose a country',
                              // labelText: 'Country',
                              items: <String>["hi", "bye"],
                              // setter: (dynamic newValue) {
                              //   formData['Country'] = newValue;
                              // }),
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
                    checkTextFieldEmptyOrNot();
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
