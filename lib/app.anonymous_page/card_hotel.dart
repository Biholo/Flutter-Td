import 'package:flutter/material.dart';

class CardHotel extends StatelessWidget {
  const CardHotel({
    super.key,
    required this.stars,
    required this.address,
    required this.notice,
    required this.rangeKm,
    required this.price,
    required this.assetName,
    this.borderRadius = 15.0,
    this.height = 250.0,
  });

  final int stars;
  final String address;
  final int notice;
  final int rangeKm;
  final int price;
  final double borderRadius;
  final double height;
  final String assetName;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      elevation: 5,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        // Image principale
                        Image.asset(
                          assetName,
                          fit: BoxFit.cover,
                          width: double
                              .infinity, // Utilisez double.infinity pour remplir toute la largeur disponible
                          height:
                              150.0, // Hauteur fixée à 150.0, ajustez selon vos besoins
                        ),
                        // Conteneur positionné en absolute pour l'icône
                        Positioned(
                          top: 10.0, // Ajustez la position verticale
                          right: 10.0, // Ajustez la position horizontale
                          child: Container(
                            padding: EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 1), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
IconData(0xf442, fontFamily: 'CupertinoIcons', fontPackage: 'cupertino_icons'),                            size:
                                  16.0, // Ajustez la taille de l'icône selon vos besoins
                              color: Color(
                                  0xFF6AD3C2), // Couleur spécifique pour l'icône
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 5.0), // ajustez l'espacement
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "Hotel $stars",
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            address,
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Text(
                            "$notice avis",
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Icon(
                              IconData(0xe3ab, fontFamily: 'MaterialIcons'),
                              size: 16.0,
                              color: Color(0xFF6AD3C2),
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              "$rangeKm km",
                              style: const TextStyle(
                                fontSize: 14.0,
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "$price €\n/nuit",
                          style: const TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
