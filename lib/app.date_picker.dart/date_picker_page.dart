import 'package:flutter/material.dart';
import 'package:first_app/common_widgets/custom_calendar.dart';

class DatePickerPage extends StatelessWidget {
  const DatePickerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CustomCalendar(),
          ],
        ),
      )
    );
  }
}