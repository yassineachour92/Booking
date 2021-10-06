import 'package:flutter/material.dart';

  Widget serach() {

return
        Material(
                elevation: 10.0,
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Color(0x55434343),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (text) {
                        // setState(() {
                        //   name = text;
                        // });
                        // print('First text field: $name');
                      },
                      textAlign: TextAlign.start,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "Search for Terrain,Salle...",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black54,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ),
              );
  }