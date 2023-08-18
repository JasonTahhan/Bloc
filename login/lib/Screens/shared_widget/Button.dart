import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  final int spacePrice;
  final VoidCallback onPressed;

  PriceButton({
    required this.spacePrice,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF297BE6),
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        'Starting price \n '
        '\$${spacePrice.toString()}/night',
        style: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
          fontFamily: 'Montserrat',
        ),
      ),
    );
  }
}
