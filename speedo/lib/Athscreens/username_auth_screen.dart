// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart'; 
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/Athscreens/snackbar.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';
import 'package:speedon/actual_app_screens/home_screen.dart';

class UserSetupScreen extends StatefulWidget {
  final String password;
  final String Phone;
  final String email;

  UserSetupScreen(
      {required this.password, required this.Phone, required this.email});
  @override
  _UserSetupScreenState createState() => _UserSetupScreenState();
}

class _UserSetupScreenState extends State<UserSetupScreen> {
  bool isLoading = false;

  TextEditingController usercontroller = TextEditingController();

  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    usercontroller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = 215;
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
            height: MediaQuery.of(context).size.height,
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Stack(fit: StackFit.expand, children: [
                  Align(
                      alignment: Alignment(0.5, -1),
                      child: header(
                          context, screenHeight, screenWidth, 'speedo services',
                          showBackButton: true)),
                  Align(
                      alignment: Alignment(0, 0.8),
                      child: auth_box(Container(
                        child: Column(children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                              ),
                              textfield_title_forth(
                                  "What should we call you ?", 18),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                                controller: usercontroller,
                                focusNode: _focusNode,
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.grey,
                                decoration: InputDecoration(
                                  filled: true, // Enables background color
                                  fillColor: Colors.grey[200],
                                  hintText: 'Enter your Name',
                                  hintStyle: TextStyle(color: Colors.grey[600]),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(
                                      color: _focusNode.hasFocus
                                          ? Colors.black
                                          : Colors.transparent,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                    borderSide: BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.all(16),
                                  // suffixIcon: usercontroller.text.isNotEmpty
                                  //     ? CircleIconButton(
                                  //         onPressed: () => {
                                  //           // this.setState(() {
                                  //           //   usercontroller.clear();
                                  //           // })
                                  //         },
                                  //         size: 20,
                                  //         icon: Icons.clear,
                                  //         secondcolor: iconclear,
                                  //         gradientColors: [
                                  //           circlegrey,
                                  //           circlegrey
                                  //         ],
                                  //         firstcolor: circlegrey,
                                  //         onChanged: (value) {}, keyboardType: TextInputType.name,
                                  //       )
                                  //     : null,
                                ),
                                onTap: () {
                                  if (!_focusNode.hasFocus) {
                                    FocusScope.of(context)
                                        .requestFocus(_focusNode);
                                  }
                                },
                                onSubmitted: (value) {
                                  _focusNode.unfocus();
                                },
                                textInputAction: TextInputAction.done),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 30,
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                              ),
                              Expanded(
                                  child: textfield_secondary_title(
                                      "You will receive your ride receipts and anything else that you agree on later.")),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 250,
                          ),
                          CustomButton(
                              onPressed: () {
                                register(
                                  widget.email,
                                  widget.password,
                                  widget.Phone,
                                  usercontroller.text,
                                );
                                showSnackBar(context,
                                    "Account created seccessfully , Login to your account !");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              },
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: white,
                                    )
                                  : Text(
                                      "Finish",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                              gradientColors: [primaryBlue, secondaryBlue]),
                        ]),
                      )))
                ]))));
  }

  void register(String email, String password, String num, String user) async {
    setState(() {
      isLoading = true;
    });
    // User creation logic using Firebase Authentication
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      CollectionReference users =
          FirebaseFirestore.instance.collection('usersss');

      users
          .doc(credential.user!.uid)
          .set({
            'phoneNumber': num,
            'password': password,
            'email': email,
            'username': user
          })
          .then((value) => print("User Added"))
          .catchError(
              (error) => showSnackBar(context, "Failed to add user: $error"));

      // User created successfully, you can navigate to the next screen or perform other actions.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isLoading = false;
    });
  }
}
