import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const cuesPrefKey = "cues";

enum EmotionalState { 
  Depressed,
  Horny,
  Monke
}

class Cue {
  DateTime date;
  TimeOfDay time = TimeOfDay.now();
  String place;
  EmotionalState emotionalState;
  String activity;
  List<String> people;

  Cue(this.date, this.place, this.emotionalState, this.activity, this.people);

  Cue.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    place = json['place'];
    emotionalState = EmotionalState.values[json['emotion']];
    activity = json['activity'];
    people = json['people'].cast<String>();
  }

  save() async {
    final cues = await loadCues();
    cues.add(this);
    saveCues(cues);
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toString(),
      'place': place,
      'emotion': emotionalState.index,
      'activity': activity,
      'people': people
    };
  }
}

Future<List<Cue>> loadCues() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final cuesJson = prefs.getStringList(cuesPrefKey) ?? [];
  final cues = cuesJson.map((cue) => Cue.fromJson(jsonDecode(cue)));
  return cues.toList();
}

saveCues(List<Cue> cues) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final cuesJson = cues.map((cue) => jsonEncode(cue.toJson()));
  await prefs.setStringList(cuesPrefKey, cuesJson.toList());
  return;
}
