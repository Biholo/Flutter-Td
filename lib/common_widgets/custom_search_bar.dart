import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.onChanged,
    required this.hintText,
    required this.color,
    required this.showButton,
    required this.textColor,
    required this.bgIcon,
    required this.colorIcon,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String hintText;
  final Color color;
  final bool showButton;
  final Color textColor;
  final Color bgIcon;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: color,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
              prefixIcon: showButton
                  ? Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: bgIcon,
                        borderRadius: BorderRadius.circular(50.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        color: colorIcon,
                      ),
                    )
                  : null,
            ),
            style: TextStyle(color: textColor),
          ),
        ),
      ],
    );
  }
}
