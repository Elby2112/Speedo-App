import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:speedon/AppThemes/colors.dart';

Widget splash_screen_logo() =>
    customSvg('assets/logo/white.svg', 250, 300, white);

Widget auth_screen_logo() =>
    customSvg('assets/logo/Logotype.svg', 50, 80, white);

Widget Appbar_logo() => Image.asset(
      'assets/logo/speedo.png',
      width: 150,
      height: 60,
      color: secondaryBlue,
    );

Widget camion() => Image.asset(
      'assets/img/camion.png',
      width: 50,
      height: 50,
      color: secondaryBlue,
    );
Widget depannage() => Image.asset(
      'assets/img/townig.png',
      width: 50,
      height: 50,
      color: secondaryBlue,
    );
Widget demenage() => Image.asset(
      'assets/img/iconmoving.png',
      width: 50,
      height: 50,
      color: secondaryBlue,
    );
Widget mechan() => Image.asset(
      'assets/img/mechanic.png',
      width: 50,
      height: 50,
      color: secondaryBlue,
    );
Widget forgon() => Image.asset(
      'assets/img/forgon.png',
      width: 220,
      height: 220,
    );
Widget hulux() => Image.asset(
      'assets/img/hulux.png',
      width: 220,
      height: 220,
    );
Widget truck() => Image.asset(
      'assets/img/truck.png',
      width: 220,
      height: 220,
    );
Widget location() => Image.asset(
      'assets/img/location1.png',
      width: 20,
      height: 20,
      color: primaryBlue,
    );
Widget location2() => Image.asset(
      'assets/img/location.png',
      width: 20,
      height: 20,
     
    );
    Widget Vector() => Image.asset(
      'assets/img/Vector.png',
      width: 20,
      height: 20,
     
    );
Widget ProfilePic() => Image.asset(
      'assets/img/profile_img.jpg',
      width: 20,
      height: 20,
     
    );

Widget customSvg(
  String path,
  double width,
  double height,
  Color color,
) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    // ignore: deprecated_member_use
    color: color,
  );
}

Widget customSvg2(
  String path,
  double width,
  double height,
  
) {
  return SvgPicture.asset(
    path,
    width: width,
    height: height,
    // ignore: deprecated_member_use
    
  );
}
