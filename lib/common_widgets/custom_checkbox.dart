import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final String label;
  final Color color;

  CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            onChanged(!value);
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: value ? color : Colors.white,
              border: Border.all(color: color),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: value
                  ? Icon(
                      Icons.check,
                      size: 20.0,
                      color: Colors.white,
                    )
                  : Icon(
                      Icons.check_box_outline_blank,
                      size: 20.0,
                      color: Colors.white,
                    ),
            ),
          ),
        ),
        SizedBox(width: 10), // Espace entre la checkbox et le texte
        Text(label),
      ],
    );
  }
}

