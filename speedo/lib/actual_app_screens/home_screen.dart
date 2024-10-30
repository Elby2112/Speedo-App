import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/AppThemes/logo.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';
import 'package:speedon/actual_app_screens/ActualApp_sharedScreens.dart';
import 'package:speedon/actual_app_screens/cargo.dart';
import 'package:speedon/actual_app_screens/heartscreen.dart';
import 'package:speedon/actual_app_screens/profile_screen.dart';
import 'package:speedon/actual_app_screens/reloadscreen.dart';
import 'package:speedon/actual_app_screens/vehicules.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          MainpageAppbar(context),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Iconfunct(
                        buttonText: "Delivery",
                        onPressedFunction: () {},
                        child: camion(),
                      ),
                      Iconfunct(
                        buttonText: "Towing",
                        onPressedFunction: () {},
                        child: depannage(),
                      ),
                      Iconfunct(
                        buttonText: "Moving",
                        onPressedFunction: () {},
                        child: demenage(),
                      ),
                      Iconfunct(
                        buttonText: "Repair",
                        onPressedFunction: () {},
                        child: mechan(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 25,
                      ),
                      textfield_title_BigBlack("Choose your vehicule"),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Column(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VehicleRent(
                                buttonText: vehicules[0].typeName,
                                onPressedFunction: () {
                                  _showMyDialog(
                                      context,
                                      vehicules[0].imagePath,
                                      vehicules[0].typeName,
                                      vehicules[0].capacity);
                                },
                                child: textfield_title_SmallWhite("Reserve"),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: forgon(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VehicleRent(
                                buttonText: vehicules[1].typeName,
                                onPressedFunction: () {
                                  _showMyDialog(
                                      context,
                                      vehicules[1].imagePath,
                                      vehicules[1].typeName,
                                      vehicules[1].capacity);
                                },
                                child: textfield_title_SmallWhite("Reserve"),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: hulux(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              VehicleRent(
                                buttonText: vehicules[2].typeName,
                                onPressedFunction: () {
                                  _showMyDialog(
                                      context,
                                      vehicules[2].imagePath,
                                      vehicules[2].typeName,
                                      vehicules[2].capacity);
                                },
                                child: textfield_title_SmallWhite("Reserve"),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 10,
                            top: 0,
                            bottom: 0,
                            child: truck(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, String imagePath,
      String title, double capacity) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Container(
            padding: EdgeInsets.all(15.0),
            width: 350.0,
            height: 500.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      'assets/img/Vector.png',
                      width: 225,
                      height: 220,
                    ),
                    Image.asset(
                      imagePath,
                      width: 250,
                      height: 200,
                    ),
                  ],
                ),
                Text(
                  title,
                  style: AppFonts.primaryFont.copyWith(
                      color: black, fontSize: 22, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'The maximal capacity of this vehicule is ' +
                      capacity.toString() +
                      ' tonnes',
                  style: AppFonts.secondaryFont.copyWith(
                      color: black, fontSize: 18, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 250,
                      child: CustomButton(
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => cargo()),
                            );
                          },
                          gradientColors: [primaryOrange, secondaryOrange]),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        width: 250,
                        child: CustomButton(
                            child: Text(
                              "Cancel",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            gradientColors: [primaryBlue, secondaryBlue]))
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final items = <Widget>[
    Icon(
      Icons.home_filled,
      size: 30,
      color: secondaryOrange,
    ),
    Icon(
      Icons.person_2_outlined,
      size: 30,
      color: secondaryOrange,
    ),
    Icon(
      Icons.favorite_border,
      size: 30,
      color: secondaryOrange,
    ),
    Icon(
      Icons.refresh,
      size: 30,
      color: secondaryOrange,
    ),
  ];

  final List<Widget> screens = [
    Home(),
    const ProfileScreen(),
    Heartscreen(),
    RelaodScren()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomNavigationKey,
      backgroundColor: white,
      body: screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        items: items,
        backgroundColor: Colors.transparent,
        height: 60,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index.
          });
        },
      ),
    );
  }
}
