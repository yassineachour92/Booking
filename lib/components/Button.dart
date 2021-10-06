import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  final List<Terrain> court;
  var id, selected;
  Function select;
  _ButtonState createState() => _ButtonState();

  Button({
    required this.court,
    this.id,
    this.selected,
    required this.select,
  });
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {



    return Row(
        children: widget.court.map((e) {
      return Padding(
        padding: const EdgeInsets.only(left:8.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Color.fromRGBO(0, 160, 227, 1))),
                      padding: EdgeInsets.all(10.0),
                  color: Color.fromRGBO(0, 160, 227, 1),
                  textColor: Colors.white,
          child: Text(e.nomTerrain),
          onPressed: () {
            setState(() {
              widget.select(e.id);
            });
          },
        ),
      );
    }).toList());
  }
}
