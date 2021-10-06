import 'package:flutter/material.dart';

class User {
  final int id, Phone;
  final String Nom, Prenom, Email, Mp;
  List<reserved> reserver;
  User({
    required this.id,
    required this.Nom,
    required this.Prenom,
    required this.Email,
    required this.Phone,
    required this.Mp,
    required this.reserver,

  });
}

List<User> user = [
  User(
      id: 1,
      Nom: "Achour",
      Prenom: "Yassine",
      Email: "yassine@gmail.com",
      Phone: 71727698,
      Mp: "123456",
      reserver: [
        new reserved(
           image:
        "https://i1.wp.com/www.construction-travaux.com/wp-content/uploads/2019/06/shutterstock_94702642.jpg?fit=4288%2C2848&ssl=1",
            name: "client 1",
            startTime: "2021-07-10-09-00-00",
            endTime: "2021,07,10,11,0,0"),
      ]),
];

class SportType {
  final String typeSport, title, image;
  final int id;

  SportType({
    required this.id,
    required this.title,
    required this.typeSport,
    required this.image,
  });
}

List<SportType> sportType = [
  SportType(
    id: 1,
    title: "Hotel",
    typeSport: "Hotel",
    image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
  ),
  SportType(
    id: 2,
    title: "tennis",
    typeSport: "tennis",
    image:
        "https://www.parisinfo.com/var/otcp/sites/images/media/1.-photos/03.-hebergement-630-x-405/hotel-enseigne-neon-630x405-c-thinkstock/31513-1-fre-FR/Hotel-enseigne-neon-630x405-C-Thinkstock.jpg",
  ),
];

class Location {
  final String type, image;
  final int id;

  Location({
    required this.id,
    required this.type,
    required this.image,
  });
}

List<Location> location = [
  Location(
    id: 1,
    type: "FootBall",
    image:
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrd5dg59ZyF5_AYBm4_yba7Zfw4eBziKzPZQ&usqp=CAU",
  ),
  Location(
    id: 2,
    type: "Tennis",
    image: "https://image.flaticon.com/icons/png/512/2379/2379628.png",
  ),
];

class Terrain {
  String nomTerrain;
  int prixday, id, prixnight;
  List<dynamic> imagesTerrain;
  List<reserved> reserver;

  Terrain({
    required this.nomTerrain,
    required this.prixday,
    required this.prixnight,
    required this.imagesTerrain,
    required this.id,
    required this.reserver,
  });
}

class reserved {
  String startTime, endTime, name,image;
  reserved({
            required this.image,

    required this.name,
    required this.startTime,
    required this.endTime,
  });
}

class Product {
  String clubName, lieu, type, description;
  List<String> images;
  int id;
  List<Terrain> court;

  Product({
    required this.clubName,
    required this.lieu,
    required this.id,
    required this.images,
    required this.description,
    required this.type,
    required this.court,
  });
}

List<Product> products = [
  new Product(
      id: 1,
      clubName: "Tennis club la marsa",
      lieu: "La Marsa",
      description: "Tennis Tennis",
      type: "tennis",
      images: [
        "https://i1.wp.com/www.construction-travaux.com/wp-content/uploads/2019/06/shutterstock_94702642.jpg?fit=4288%2C2848&ssl=1 "
      ],
      court: [
        new Terrain(
          id: 1,
          imagesTerrain: [
            "https://i1.wp.com/www.construction-travaux.com/wp-content/uploads/2019/06/shutterstock_94702642.jpg?fit=4288%2C2848&ssl=1",
            "https://static.lexpress.fr/medias_11584/w_1000,h_563,c_fill,g_north/v1503052613/terrain-de-tennis_5931094.jpg"
          ],
          nomTerrain: "court 1",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
               image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021,07,10,11,0,0"),
            new reserved(
               image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 2",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021-07-10-11-00-00"),
          ],
        ),
      ]),
  new Product(
      id: 2,
      clubName: "Tennis club  Carthage",
      lieu: "Carthage",
      description: "Tennis Tennis",
      type: "tennis",
      images: [
        "https://i1.wp.com/www.construction-travaux.com/wp-content/uploads/2019/06/shutterstock_94702642.jpg?fit=4288%2C2848&ssl=1 "
      ],
      court: [
        new Terrain(
          id: 1,
          imagesTerrain: [
            "https://fr.mylivingbloom.com/wp-content/uploads/2020/07/84-Comment-construire-un-terrain-de-tennis3-1080x672.jpg",
          ],
          nomTerrain: "court 1",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021-07-10-10-00-00"),
          ],
        ),
        new Terrain(
          id: 2,
          imagesTerrain: [
            "https://www.landerneau.bzh/medias/2018/01/Reserver-un-court-de-tennis.png",
          ],
          nomTerrain: "court 2",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021-07-10-10-00-00"),
          ],
        ),
        new Terrain(
          id: 3,
          imagesTerrain: [
            "https://www.sm-devis.tn/wp-content/uploads/2019/11/Prix-de-la-construction-dun-court-de-tennis-tunisie.jpg",
          ],
          nomTerrain: "court 3",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-12-09-00-00",
                endTime: "2021-07-12-11-00-00"),
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-13-09-00-00",
                endTime: "2021-07-13-11-00-00"),
          ],
        ),
        new Terrain(
          id: 4,
          imagesTerrain: [
            "https://www.sm-devis.tn/wp-content/uploads/2019/11/Prix-de-la-construction-dun-court-de-tennis-tunisie.jpg",
          ],
          nomTerrain: "court 4",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021-07-10-11-00-00"),
          ],
        ),
        new Terrain(
          id: 5,
          imagesTerrain: [
            "https://www.sm-devis.tn/wp-content/uploads/2019/11/Prix-de-la-construction-dun-court-de-tennis-tunisie.jpg",
          ],
          nomTerrain: "court 5",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-10-09-00-00",
                endTime: "2021-07-10-11-00-00"),
          ],
        ),
        new Terrain(
          id: 6,
          imagesTerrain: [
            "https://www.sm-devis.tn/wp-content/uploads/2019/11/Prix-de-la-construction-dun-court-de-tennis-tunisie.jpg",
          ],
          nomTerrain: "court 6",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-12-09-00-00",
                endTime: "2021-07-12-11-00-00"),
          ],
        ),
      ]),
  new Product(
      id: 3,
      clubName: "Tennis club Tunis",
      lieu: "Tunis",
      description: "Tennis Tennis",
      type: "tennis",
      images: [
        "https://i1.wp.com/www.construction-travaux.com/wp-content/uploads/2019/06/shutterstock_94702642.jpg?fit=4288%2C2848&ssl=1 "
      ],
      court: [
        new Terrain(
          id: 1,
          imagesTerrain: [
            "https://www.techni-contact.com/ressources/images/produits/zoom/construction-renovation-terrain-de-tennis-en-beton-12575809-3.jpg",
          ],
          nomTerrain: "court 1",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-12-09-00-00",
                endTime: "2021-07-12-11-00-00"),
          ],
        ),
        new Terrain(
          id: 2,
          imagesTerrain: [
            "https://anybuddyapp.com/wp-content/uploads/2018/02/court_n2_2.jpg",
          ],
          nomTerrain: "court 2",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-12-09-00-00",
                endTime: "2021-07-12-11-00-00"),
          ],
        ),
        new Terrain(
          id: 3,
          imagesTerrain: [
            "https://www.techni-contact.com/ressources/images/produits/zoom/6519375-1.jpg",
          ],
          nomTerrain: "court 3",
          prixday: 10,
          prixnight: 20,
          reserver: [
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 1",
                startTime: "2021-07-12-09-00-00",
                endTime: "2021-07-12-11-00-00"),
            new reserved(
              image:
        "https://png.pngtree.com/png-vector/20190521/ourlarge/pngtree-hotel-icon-for-personal-and-commercial-use-png-image_1044892.jpg",
                name: "client 2",
                startTime: "2021-07-13-09-00-00",
                endTime: "2021-07-13-11-00-00"),
          ],
        ),
      ])
];
