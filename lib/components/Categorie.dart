import 'package:bookingapp/components/Cardbytype.dart';
import 'package:flutter/material.dart';

Widget Categorie(List image, String imgUrl, context, String type,
    String description, String lieu, int price, String detail,String clubName) {
  var x;
  var y;
  (description != "" ? (x = 200.0) : (x = 85.0));
  (description != "" ? (y = 150.0) : (y = 30.0));
  return Column(
    children: <Widget>[
      new GestureDetector(
        onTap: () => 
          Navigator.push(
            context,
            MaterialPageRoute(
               builder: (context) => 
                detail != ""
                  ?
                  Cardbytype(context, clubName,"details")

                  // Details(context, description, image, price, type)
                  :
                  Cardbytype(context,type,"")
                  //  ShowIteam(
                  //     imgUrl, context, type, description, lieu, price)
                  //     )
              // ShowIteam(imgUrl,context,type, description, Location,price)
              ),
        ),
  
        child: Container(
          padding: EdgeInsets.all(8.0),
          width: x,
          decoration: BoxDecoration(
            // color: Colors.white,
            borderRadius: BorderRadius.only(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            crossAxisAlignment: CrossAxisAlignment.stretch, // add this
            children: <Widget>[
              (description != ""
                  ? Container(
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                          ),
                        ],
                        image: DecorationImage(
                            image: NetworkImage(
                              image[0],
                            ),
                            fit: BoxFit.fill),
                      ),
                    )
                  : Container(
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: NetworkImage(imgUrl), fit: BoxFit.fill),
                        // ),
                      ),
                    )),
              (description != ""
                  ? Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2.0,
                          ),
                        ],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(children: <Widget>[
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(type !=""?type : clubName)),
                          SizedBox(height: 8.0),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                description,
                                maxLines: 1,
                              )),
                          SizedBox(height: 8.0),
                          Row(
                            children: [
                              Icon(
                                Icons.room,
                                color: Color(0xFF26beb5),
                              ),
                              Text(
                                lieu,
                              ),
                            ],
                          ),
                        ]),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Text(type),
                    )),
            ],
          ),
        ),
      ),

      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20.0/4 ),
      //   child: Text("test",style: TextStyle(color:Color(0xFFACACAC) ),),
      // ),
    ],
  );
}
