import 'package:bookingapp/components/Details.dart';
// import 'package:bookingapp/components/provider/event_provider.dart';
import 'package:bookingapp/components/utils.dart';
import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AddEvent extends StatefulWidget {
  final reserved? event;

  const AddEvent({
    Key? key,
    this.event, required List<reserved> resevation,
  }) : super(key: key);
  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEvent> {
  final _formKey = GlobalKey<FormState>();
  late DateTime startTime;
  late DateTime endTime;
  final titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.event == null) {
      startTime = DateTime.now();
      endTime = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Material(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(0),
          child: Form(
            key: _formKey,
            child: Column(
              //   appBar: AppBar(
              // leading: CloseButton(),
              // actions: buildEditingActions(),
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                buildTitle(),
                SizedBox(
                  height: 12,
                ),
                buildDateTime(context),
                ElevatedButton.icon(
                  icon: Icon(Icons.done),
                  label: Text('Save'),
                  onPressed: () {
                    saveForm();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          style: TextStyle(fontSize: 16),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Ajouter Votre Nom',
          ),
          onFieldSubmitted: (_) => saveForm(),
          validator: (title) =>
              title != null && title.isEmpty ? 'Title cannot be empty' : null,
          controller: titleController,
        ),
      );

  Widget buildDateTime(BuildContext context) => Column(
        children: [
          buildForm(context),
          buildTo(context),
        ],
      );

  Widget buildForm(BuildContext context) => buildHeader(
        header: 'FROM',
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: buildDropdownField(
                text: Utils.toDate(startTime),
                onClicked: () => pickFromDateTime(pickDate: true),
              ),
            ),
            Expanded(
              flex: 2,
              child: buildDropdownField(
                text: Utils.toTime(startTime),
                onClicked: () => pickFromDateTime(pickDate: false),
              ),
            ),
          ],
        ),
      );

  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(startTime, pickDate: pickDate);
    if (date == null) return;
    if (date.isAfter(endTime)) {
      endTime = DateTime(
          date.year, date.month, date.day, endTime.hour, endTime.minute);
    }
    setState(() {
      startTime = date;
    });
  }

  Future<DateTime?> pickDateTime(DateTime initialDate,
      {required bool pickDate, DateTime? firstDate}) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2020, 8),
        lastDate: DateTime(2050),
      );
      if (date == null) return null;
      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);
      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );
      if (timeOfDay == null) return null;
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }

  Widget buildDropdownField(
          {required String text, required VoidCallback onClicked}) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down),
        onTap: onClicked,
      );

  Widget buildHeader({required String header, required Row child}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child,
        ],
      );

  Widget buildTo(BuildContext context) => buildHeader(
        header: 'TO',
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: buildDropdownField(
                  text: Utils.toDate(endTime),
                  onClicked: () => pickToDateTime(pickDate: true)),
            ),
            Expanded(
              flex: 2,
              child: buildDropdownField(
                  text: Utils.toTime(endTime),
                  onClicked: () => pickToDateTime(pickDate: false)),
            ),
          ],
        ),
      );
  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      endTime,
      pickDate: pickDate,
      firstDate: pickDate ? startTime : null,
    );
    if (date == null) return;
    setState(() {
      endTime = date;
    });
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      final event = reserved(
        image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg", 
        name: titleController.text,
        startTime: startTime.toString(),
        endTime: endTime.toString(),
      );
      // final provider = Provider.of<EventProvider>(context, listen: false);
      // provider.addEvent(event);
      Navigator.of(context).pop();
    }
  }
}
