import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/logo.dart';
//import 'package:speedon/mainscreen.dart';
import 'package:speedon/actual_app_screens/cargo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  void _navigateToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => cargo()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
                center: Alignment(0.8, -0.8),
                radius: 2,
                colors: [primaryBlue, secondaryBlue]),
          ),
          child: Center(
            child: splash_screen_logo(),
          )),
    );
  }
}
