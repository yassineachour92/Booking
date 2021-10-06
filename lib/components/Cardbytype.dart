import 'package:bookingapp/components/ProductDetails.dart';
import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';

Widget Cardbytype(context, String type, String details) {
  var size = MediaQuery.of(context).size;

  /*24 is for notification bar on Android*/
  final double itemHeight = (size.height - kToolbarHeight - 24) / 2.8;
  final double itemWidth = size.width / 2;
  var data;
  var y;
  if (details != "") {
    data =
        products.where((e) => e.clubName.toLowerCase() == type.toLowerCase());
    y = MediaQuery.of(context).size.height;
  } else {
    data = products.where((e) => e.type.toLowerCase() == type.toLowerCase());
    y = MediaQuery.of(context).size.height * 0.39;
  }
  return Scaffold(
    backgroundColor: Colors.white,
    body: Body(
      data: data,
      itemWidth: itemWidth,
      itemHeight: itemHeight,
      details: details,
      y: y,
    ),
  );
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.data,
    required this.itemWidth,
    required this.itemHeight,
    required this.details,
    required this.y,
  }) : super(key: key);

  final Iterable<Product> data;
  final double itemWidth;
  final double itemHeight;
  final String details;
  final double y;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: data.map((type) {
        return Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 10, top: 20),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      type.clubName +
                          " (" +
                          type.court.length.toString() +
                          " Terrain(s))",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Gridview(
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                court: type.court,
                lieu: type.lieu,
                clubName: type.clubName,
                y: y,
                details: details,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

class Gridview extends StatelessWidget {
  const Gridview({
    Key? key,
    required this.itemWidth,
    required this.itemHeight,
    required this.court,
    required this.lieu,
    required this.clubName,
    required this.y,
    required this.details,
  }) : super(key: key);

  final double itemWidth;
  final double itemHeight;
  final Iterable<Terrain> court;
  final String lieu;
  final String clubName;
  final String details;

  final double y;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: y,
        child: details != ""
            ? GridView.count(
                scrollDirection: Axis.vertical,
                childAspectRatio: (itemWidth / itemHeight) * 0.9,
                crossAxisCount: 2,
                children: court
                    .map<Widget>((e) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                        e.id,
                                        context,
                                        "",
                                        e.imagesTerrain,
                                        e.prixday,
                                        e.prixnight,
                                        e.nomTerrain,
                                        lieu: lieu,
                                        clubName: clubName,
                                        allCourt: e,
                                      ))),

                          // Details(context,
                          //             e.description, e.images,0,e.clubName))

                          child: (Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: (Container(
                              margin: new EdgeInsets.all(0.5),
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 7,
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.network(
                                        e.imagesTerrain[0],
                                        height: 150.0,
                                        width: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                          child: Text(
                                        e.nomTerrain,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Text(
                                        " ${e.prixday}\DT/Day",
                                      ),
                                      Text(
                                        " ${e.prixnight}\DT/Day",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          )),
                        ))
                    .toList())
            : ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: court
                    .map<Widget>((e) => GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                        e.id,
                                        context,
                                        "",
                                        e.imagesTerrain,
                                        e.prixday,
                                        e.prixnight,
                                        e.nomTerrain,
                                        lieu: lieu,
                                        clubName: clubName,
                                        allCourt: e,
                                      ))),

                          // Details(context,
                          //             e.description, e.images,0,e.clubName))

                          child: (Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: (Container(
                              margin: new EdgeInsets.all(0.5),
                              child: Card(
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 7,
                                child: SizedBox(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.network(
                                        e.imagesTerrain[0],
                                        height: 150.0,
                                        width: 200.0,
                                        fit: BoxFit.cover,
                                      ),
                                      Container(
                                          child: Text(
                                        e.nomTerrain,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )),
                                      Text(
                                        " ${e.prixday}\DT/Day",
                                      ),
                                      Text(
                                        " ${e.prixnight}\DT/Day",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          )),
                        ))
                    .toList()),
      ),
    );
  }
}
