import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorSnackbar {
  static void showErrorSnackbar(BuildContext context, String errorMessage) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Color(0xFFEAD5D8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/alert.svg', 
                color: Color(0xFFAE2D3C),
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Flexible(
                child: Text(
                  errorMessage,
                  style: TextStyle(
                    color: Color(0xFFAE2D3C),
                    fontFamily: 'MontserratMedium',
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0, 
        behavior: SnackBarBehavior.floating, 
       margin: EdgeInsets.only(
          bottom:537 ,right: 5,left: 5,),
        duration: Duration(seconds: 3),
      ),
    );
  }
}
