import 'package:first_app/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends CustomElevatedButton {
  PrimaryButton({
    required String text,
    required Color color,
    required Color textColor,
    required VoidCallback onPressed,
  }) : super(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 15.0,
              ),
            ),
          ],
        ),  
        
        color: color,
        onPressed: onPressed,
        borderRadius: 30.0, // Rayon des coins
        height: 40.0, // Hauteur du bouton
      );
}
