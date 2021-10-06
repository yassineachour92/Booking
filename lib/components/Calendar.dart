import 'package:bookingapp/components/Details.dart';
import 'package:bookingapp/components/provider/event_provider.dart';
import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarApp extends StatefulWidget {
  final List<reserved> resevation;

  const CalendarApp({Key? key, required this.resevation}) : super(key: key);
  @override
  _CalendarAppState createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarApp> {
  @override
  Widget build(BuildContext context) {
    // final events = Provider.of<EventProvider>(context).events;
    return Material(
      child: Stack(children: [
        Padding(
            padding: const EdgeInsets.all(00.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: SfCalendar(
                view: CalendarView.month,
                initialSelectedDate: DateTime.now(),
                showNavigationArrow: true,
    
                dataSource: MeetingDataSource(_getDataSource()),
                // by default the month appointment display mode set as Indicator, we can
                // change the display mode as appointment using the appointment display
                // mode property
                appointmentTimeTextFormat: 'HH:mm',
                monthViewSettings: MonthViewSettings(
                  showAgenda: true,
                ),
                // monthViewSettings: const MonthViewSettings(
                // appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
              ),
            )),
      ]),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    widget.resevation.map((e) {
      final date = e.startTime.split('-');
      final DateTime startTime = DateTime(
          int.parse(date[0]),
          int.parse(date[1]),
          int.parse(date[2]),
          int.parse(date[3]),
          int.parse(date[4]),
          int.parse(date[5]));

      final DateTime endTime = startTime.add(const Duration(hours: 2));
      meetings
          .add(Meeting(e.name, startTime, endTime, Colors.blue, false));
    }).toList();
    return meetings;
  }
}

/// An object to set the appointment collection data source to calendar, which
/// used to map the custom appointment data to the calendar appointment, and
/// allows to add, remove or reset the appointment collection.
class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}
