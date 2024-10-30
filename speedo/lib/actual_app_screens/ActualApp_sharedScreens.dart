import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/AppThemes/logo.dart';

Widget textfield_title_fifth(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont.copyWith(
          color: Colors.amber, fontSize: 13, fontWeight: FontWeight.w900),
    );

Widget textfield_title_BigBlack(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont
          .copyWith(color: black, fontSize: 34, fontWeight: FontWeight.w800),
    );

Widget textfield_title_BigWhite(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont
          .copyWith(color: white, fontSize: 32, fontWeight: FontWeight.w900),
    );

Widget textfield_title_SmallWhite(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont
          .copyWith(color: white, fontSize: 22, fontWeight: FontWeight.w800),
    );

Widget MainpageAppbar(
  BuildContext context,
) =>
    Container(
      height: 115,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(children: [
            SizedBox(
              width: 15,
            ),
            Appbar_logo(),
            SizedBox(
              width: 150,
            ),
            IconButton(
              icon: Icon(
                Icons.notifications_on_outlined,
                color: black,
                size: 30,
              ),
              onPressed: () {},
            ),
            SizedBox(
              width: 15,
            ),
          ]),
        ],
      ),
    );

class Iconfunct extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;
  final Widget child;

  const Iconfunct({
    required this.buttonText,
    required this.onPressedFunction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onPressedFunction,
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(8),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              padding: MaterialStateProperty.all(EdgeInsets.all(15)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
            child: child, // Replace with your actual child widget
          ),
          SizedBox(
            height: 15,
          ),
          textfield_title_fifth(
              buttonText), // Replace with your actual text widget
        ],
      ),
    );
  }
}

class VehicleRent extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressedFunction;
  final Widget child;

  const VehicleRent({
    required this.buttonText,
    required this.onPressedFunction,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(70),
          bottomLeft: Radius.circular(70),
        ),

        gradient: LinearGradient(
          colors: [primaryBlue, secondaryBlue],
          begin: Alignment.topRight,
          end: Alignment.topLeft,
        ),
        //color: primaryBlue,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(width: 80),
              textfield_title_BigWhite(buttonText),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
              ),
              ElevatedButton(
                onPressed: onPressedFunction,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.orange[400]),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(23, 2, 23, 2)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                ),
                child: child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}