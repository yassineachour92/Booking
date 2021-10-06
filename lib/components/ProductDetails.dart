import 'package:bookingapp/components/Details.dart';
import 'package:bookingapp/components/pannier.dart';
import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';

Widget ProductDetails(
  id,
  context,
  description,
  imgUrl,
  prixday,
  prixnight,
  title, {
  required String lieu,
  required String clubName,
  required Terrain allCourt,
}) {
  var selectedCourt;
  return Scaffold(
    backgroundColor: Color(0xFFF5F6F9),
    appBar: buildAppBar(context, clubName),
    body: Details(
      description: description,
      imgUrl: imgUrl,
      prixday: prixday,
      prixnight: prixnight,
      title: title,
      lieu: lieu,
      clubName: clubName,
      id: id,
      allCourt: allCourt,
      selectedCourt: id,
    ),
  );
}

AppBar buildAppBar(BuildContext context, clubName) {
  return AppBar(
    backgroundColor: Color(0xFFF1EFF1),
    elevation: 0,
    leading: IconButton(
      padding: EdgeInsets.only(left: 20.0),
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black54,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    centerTitle: false,
    title: Text(
      clubName,
      style: Theme.of(context).textTheme.bodyText2,
    ),
    actions: [
    
      IconButton(
        padding: EdgeInsets.only(left: 10.0),
        icon: Icon(
          Icons.add_shopping_cart,
          color: Colors.black54,
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Pannier()));
        },
      ),
    ],
  );
}
