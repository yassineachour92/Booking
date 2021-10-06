import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventProvider extends ChangeNotifier {
  final List<reserved> _events = [];
  List<reserved> get events => _events;
  void addEvent(reserved event) {
    _events.add(event);
    notifyListeners();
  }
}
