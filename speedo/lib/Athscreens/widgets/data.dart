import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/AppThemes/logo.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';

class GetdataFromFirestore extends StatelessWidget {
  final String documentId;

  GetdataFromFirestore({required this.documentId});

  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('usersss');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 280,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 118, 194, 236),
                                    Color.fromARGB(255, 79, 148, 230),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(children: [
                              SizedBox(
                                height: 50,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Profile',
                                    style: AppFonts.primaryFont.copyWith(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                  SizedBox(
                                    width: 200,
                                  ),
                                  Container(
                                      width: 80,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 79, 148, 230),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Center(
                                        child: Text(
                                          'Edit Profile',
                                          style: AppFonts.primaryFont.copyWith(
                                            color: white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: ProfilePic()),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${data['username']}',
                                style: AppFonts.primaryFont.copyWith(
                                    color: white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ])),
                        SizedBox(
                          height: 20,
                        ),
                        profileButton(Icons.email, '${data['email']}', () {}),
                        SizedBox(
                          height: 20,
                        ),
                        profileButton(
                            Icons.phone, '0${data['phoneNumber']}', () {}),
                        SizedBox(
                          height: 20,
                        ),
                        profileButton(Icons.language, 'English', () {}),
                        SizedBox(
                          height: 20,
                        ),
                        profileButton(Icons.logout, 'Sign Out', () {
                          FirebaseAuth.instance.signOut();
                        }),
                      ],
                    ),
                  )));
        }

        return Text("loading");
      },
    );
  }
}
