import 'package:driverapp/AppThemes/fonts.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'This is the home page',
        style: AppFonts.primaryFont
            .copyWith(fontSize: 35, fontWeight: FontWeight.bold),
      )),
    );
  }
}
