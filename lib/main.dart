import 'package:bookingapp/components/Categorie.dart';
import 'package:bookingapp/components/login.dart';
// import 'package:bookingapp/components/provider/event_provider.dart';
import 'package:bookingapp/components/section_title.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'components/serach.dart';
import 'data/Data.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class BookingApp extends StatefulWidget {
  @override
  _BookingAppState createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  Widget build(BuildContext context) {
  // => ChangeNotifierProvider(
  //   create:(context)=>EventProvider(),
  //   child:
  return  Scaffold(
        backgroundColor: Color(0xFFF8F8F8),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
          child: ListView(
            primary: false,
            shrinkWrap: true,
            children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: serach(),
            ),
            SizedBox(height: 20),
            Column(
              
              children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: (5)),
                        child: SectionTitle(
                          title: "Sports",
                          press: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 140.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: location
                      .map<Widget>(
                        (location) => Categorie([], location.image, context,
                            location.type, "", "", 0, "",""),
                      )
                      .toList(),
                ),
              ),
            ]),
         
          Column(children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: (5)),
                        child: SectionTitle(
                          title: "Location",
                          press: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 140.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: sportType.map<Widget>(
                        (Type) => Categorie([], Type.image, context,
                            Type.typeSport, "", "", 0, "",""),
                      )
                      .toList(),
                ),
              ),
            ]),
         
         Column(children: [
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.grey),
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: (5)),
                        child: SectionTitle(
                          title: "Tennis",
                          press: () {},
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 300.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: products.map<Widget>(
                        (Type) => Categorie(Type.images,"", context,
                            "", Type.description,Type.lieu, 0, "details",Type.clubName),
                      )
                      .toList(),
                ),
              ),
            ]),
         
         
          ])
        )
    );
  }
}
