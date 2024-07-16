import 'package:flutter/material.dart';
import 'package:first_app/app.anonymous_page/card_hotel.dart';
import 'package:first_app/common_widgets/custom_calendar.dart';
import 'package:first_app/common_widgets/custom_search_bar.dart';
import 'package:first_app/app.call_api/call_api.dart';

class AnonymousPage extends StatelessWidget {
  const AnonymousPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hôtels',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomSearchBar(
              onChanged: (text) {
                print('Recherche: $text');
              },
              hintText: 'Rechercher un hôtel',
              color: Colors.white,
              showButton: true,
              textColor: Colors.black,
              bgIcon: Color(0xFF6AD3C2),
              colorIcon: Colors.white,
            ),
            CustomCalendar(),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const CardHotel(
                assetName: 'images/hotel1.logo.png',
                stars: 5,
                address: 'Rua das Flores, 123',
                notice: 4,
                rangeKm: 2,
                price: 200,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const CardHotel(
                stars: 4,
                address: 'Rua das Flores, 123',
                notice: 3,
                rangeKm: 3,
                price: 150,
                assetName: 'images/hotel2.logo.png',
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              child: const CardHotel(
                stars: 3,
                address: 'Rua das Flores, 123',
                notice: 2,
                rangeKm: 4,
                price: 100,
                assetName: 'images/hotel3.logo.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
