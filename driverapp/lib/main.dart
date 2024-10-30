import 'package:driverapp/Authscreens/driver_info.dart';
//import 'package:driverapp/Authscreens/password_ath_screen.dart';
//import 'package:driverapp/Authscreens/personal_information_screen.dart';
//import 'package:driverapp/Authscreens/splash_screen.dart';
import 'package:driverapp/Authscreens/vehicle_information_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
//import 'package:driverapp/Authscreens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(driverapp());
}

class driverapp extends StatelessWidget {
  const driverapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => DriverInfo(),
        child: MaterialApp(
            title: 'Flutter Demo',
            // ignore: deprecated_member_use
            theme: ThemeData(backgroundColor: Colors.grey[800]),
            debugShowCheckedModeBanner: false,
            home: VehicleInformation()));
  }
}
