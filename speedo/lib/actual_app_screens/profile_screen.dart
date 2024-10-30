import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speedon/Athscreens/widgets/data.dart';


class ProfileScreen extends StatefulWidget {
  
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final  credential = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return GetdataFromFirestore(documentId:credential!.uid);
  }
}

