
import 'package:bookingapp/data/Data.dart';
import 'package:flutter/material.dart';

class Pannier extends StatefulWidget {
  const Pannier({
    Key? key,
  }) : super(key: key);
  @override
  _PannierState createState() => _PannierState();
}

class _PannierState extends State<Pannier> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 2;
    var y = MediaQuery.of(context).size.height;






    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: buildAppBar(context),
        body: _buildBottomSingleDetail(
          itemHeight: itemHeight,
          itemWidth: itemWidth,
          y: y,
        )
        
        );
  }

  _buildBottomSingleDetail({
    required double itemHeight,
    required double itemWidth,
    required double y,
  }) {
    return ListView(
      children: user.map((user) {
        return Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              Gridview(
                itemWidth: itemWidth,
                itemHeight: itemHeight,
                court: user.reserver,
                y: y,
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

AppBar buildAppBar(BuildContext context) {
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
      "List des terrains reserver",
      style: Theme.of(context).textTheme.bodyText2,
    ),
  );
}

class Gridview extends StatelessWidget {
  const Gridview({
    Key? key,
    required this.itemWidth,
    required this.itemHeight,
    required this.court,
    required this.y,
  }) : super(key: key);

  final double itemWidth;
  final double itemHeight;
  final Iterable<reserved> court;

  final double y;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: y,
        child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.only(bottom: 150),
            children: court
                .map<Widget>((e) => Padding(
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
                              children: <Widget>[
                                Row(
                                  children: [
                                    Image.network(
                                      e.image,
                                      height: 150.0,
                                      width: 150.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            //Use of SizedBox
                                            height: 10,
                                          ),
                                          Align(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              "Nom du court: ${e.name}",
                                            ),
                                          ),
                                          SizedBox(
                                            //Use of SizedBox
                                            height: 10,
                                          ),
                                          Text(
                                            "Debut : ${e.startTime}",
                                          ),
                                          SizedBox(
                                            //Use of SizedBox
                                            height: 20,
                                          ),
                                          Text(
                                            "Fin : ${e.endTime}",
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 20.0),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  //Use of SizedBox
                                                  width: 5,
                                                ),
                                                FlatButton(
                                                  color: Color.fromRGBO(
                                                      0, 160, 227, 1),
                                                  splashColor: Colors.green,
                                                  textColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {},
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text("Annuler"),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                FlatButton(
                                                  color: Color.fromRGBO(
                                                      0, 160, 227, 1),
                                                  splashColor: Colors.green,
                                                  padding: EdgeInsets.all(10.0),
                                                  textColor: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {},
                                                  child: Text("Confirmer"),
                                                ),

                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                    ))
                .toList()));
  }
}
