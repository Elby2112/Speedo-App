import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:speedon/Athscreens/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(speedon());
}

class speedon extends StatelessWidget {
  const speedon({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // ignore: deprecated_member_use
      theme: ThemeData(backgroundColor: Colors.grey[800]),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
