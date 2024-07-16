import 'package:first_app/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'custom_checkbox.dart';
import 'custom_elevated_button.dart';
import 'primary_button.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  DateTime? _arrivalDate;
  DateTime? _departureDate;
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _calendarFormat = CalendarFormat.month;
    _selectedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = focusedDay;
      if (start != null && end != null && end.isBefore(start)) {
        // If the end date is before the start date, reset the end date
        _arrivalDate = start;
        _departureDate = null;
      } else {
        _arrivalDate = start;
        _departureDate = end;
      }
    });
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day} ${_monthString(date.month)}';
  }

  String _monthString(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // border color
                    width: 1.0, // border width
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Arrivée',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _formatDate(_arrivalDate),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // border color
                    width: 1.0, // border width
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Départ',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      _formatDate(_departureDate),
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          rangeSelectionMode: RangeSelectionMode.toggledOn,
          onRangeSelected: _onRangeSelected,
          rangeEndDay: _departureDate,
          rangeStartDay: _arrivalDate,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          
        ),
        SizedBox(
          height: 20.0,
        ),
       CustomCheckbox(
          value: _isChecked,
          onChanged: (value) {
            setState(() {
              _isChecked = value!;
            });
          },
          color: Color(0xFF6AD3C2),
          label: 'Flexibles avec les dates',
       ),
       SizedBox(
          height: 20.0,
        ),
        PrimaryButton(
              text: 'Appliquer',
              color: Color(0xFF6AD3C2),
              textColor: Colors.white,
              onPressed: () {
                print('appliquer');
              },
            ),
       
      ],
    );
  }
}
