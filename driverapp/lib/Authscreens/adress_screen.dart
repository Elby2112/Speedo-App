import 'package:driverapp/Authscreens/vehicle_information_screen.dart';
import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:driverapp/widgets/shared_widget.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/AppThemes/colors.dart';
import 'package:driverapp/AppThemes/fonts.dart';

//import 'package:file_picker/file_picker.dart';
//import 'dart:io';

class AdressInformations extends StatefulWidget {
  AdressInformations({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdressInformationsState createState() => _AdressInformationsState();
}

class _AdressInformationsState extends State<AdressInformations> {
  TextEditingController housenocontroller = TextEditingController();
  TextEditingController streetcontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController postalcodecontroller = TextEditingController();
  @override
  void dispose() {
    housenocontroller.dispose();
    streetcontroller.dispose();
    citycontroller.dispose();
    postalcodecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(25),
                //boxShadow: [
                //BoxShadow(
                //color: Colors.grey.withOpacity(0.2),
                //spreadRadius: 5,
                //blurRadius: 7,
                //offset: Offset(0, 3),
                //),
                //],
              ),
              width: screenWidth - 40,
              height: screenHeight - 40,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Adress Informations',
                        style: AppFonts.primaryFont.copyWith(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      textfield_title_forth('House no'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField2(
                    hintText: 'house no',
                    width: 320,
                    controller: housenocontroller,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      textfield_title_forth('Street'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField2(
                    hintText: 'street',
                    width: 320,
                    controller: streetcontroller,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      textfield_title_forth('City'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField2(
                    hintText: 'city',
                    width: 320,
                    controller: citycontroller,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      textfield_title_forth('Postal Code'),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  CustomTextField2(
                    hintText: 'postal code',
                    width: 320,
                    controller: postalcodecontroller,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  CustomButton(
                      width: 320,
                      text: 'Submit',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VehicleInformation()),
                        );
                      },
                      gradientColors: [primaryGreen, secondaryGreen]),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ))));
  }
}
