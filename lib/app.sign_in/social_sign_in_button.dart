import 'package:first_app/common_widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton({
    required String text,
    required Color textColor,
    required Color color,
    double borderRadius = 4.0,
    required VoidCallback onPressed,
    required String assetName,
  }) : super(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          assetName,
          width: 25.0,
          height: 25.0,
        ),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: 15.0,
          ),
        ),
        Image.asset(
          assetName,
          width: 25.0,
          height: 25.0,
        ),
      ],
    ),
    color: color,
    borderRadius: borderRadius,
    onPressed: onPressed,
  );
}
