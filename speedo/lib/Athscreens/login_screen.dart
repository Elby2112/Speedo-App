// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:password_text_field/password_text_field.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/Athscreens/number_verif_screen.dart';
import 'package:speedon/Athscreens/resetPassword.dart';
import 'package:speedon/Athscreens/snackbar.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SignIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailsetupcontroller.text,
        password: passwordcontroller.text,
      );
      if (!mounted) return;
      showSnackBar(context, "Signed in seccussfully !");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackBar(context, 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showSnackBar(context, 'Wrong password provided for that user.');
      }
    }
  }

  TextEditingController emailsetupcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  String _errorMessage = '';

  @override
  void dispose() {
    emailsetupcontroller.dispose();
    passwordcontroller.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
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
                          showBackButton: false)),
                  Align(
                    alignment: Alignment(0, 0.8),
                    child: auth_box(
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Align(
                                alignment: Alignment.topLeft,
                                child: textfield_title('Email Address'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: TextField(
                              focusNode: _focusNode1,
                              style: TextStyle(color: Colors.black),
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'Enter your Email',
                                hintStyle: TextStyle(color: Colors.grey[600]),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: _focusNode1.hasFocus
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                contentPadding: EdgeInsets.all(16),
                                // suffixIcon: emailsetipcontroller.text.isNotEmpty
                                //     ? CircleIconButton(
                                //         onPressed: () => {
                                //           this.setState(() {
                                //             emailcontroller.clear();
                                //           })
                                //         },
                                //         size: 20,
                                //         icon: Icons.clear,
                                //         secondcolor: iconclear,
                                //         gradientColors: [
                                //           circlegrey,
                                //           circlegrey
                                //         ],
                                //         firstcolor: circlegrey,
                                //         onChanged: (value) {}, keyboardType: TextInputType.emailAddress,
                                //       )
                                //     : null,
                              ),
                              onTap: () {
                                if (!_focusNode1.hasFocus) {
                                  FocusScope.of(context)
                                      .requestFocus(_focusNode1);
                                }
                              },
                              onSubmitted: (value) {
                                _focusNode1.unfocus();
                              },
                              controller: emailsetupcontroller,
                              onChanged: (val) {
                                // validateEmail(val);
                              },
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(
                                width: 190,
                              ),
                              Text(
                                _errorMessage,
                                style: AppFonts.secondaryFont.copyWith(
                                    color: Colors.red,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(width: 30),
                              Align(
                                alignment: Alignment.topLeft,
                                child: textfield_title('Password'),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 300,
                            child: Theme(
                                data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: Colors.grey,
                                )),
                                child: PasswordTextField(
                                  controller: passwordcontroller,
                                  focusNode: _focusNode2,
                                  style: TextStyle(
                                    color: black,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIconColor: secondaryBlue,
                                    filled: true, // Enables background color
                                    fillColor: Colors.grey[200],
                                    hintText: 'Enter your password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: _focusNode2.hasFocus
                                            ? Colors.black
                                            : Colors.transparent,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(color: black),
                                    ),
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onTap: () {
                                    if (!_focusNode2.hasFocus) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode2);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    _focusNode2.unfocus();
                                  },
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 200,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResetPass()),
                                  );
                                },
                                child: textfield_secondary_title(
                                    'Forget Password?'),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () async {
                                await SignIn();
                              //    Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HomeScreen()),
                              // );

                              },
                              gradientColors: [primaryBlue, secondaryBlue]),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: textfield_secondary_title(
                                'Or create an account'),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomButton(
                            child: Text(
                              "Sign up",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PhoneAuthScreen()),
                              );
                            },
                            gradientColors: [primaryOrange, secondaryOrange],
                          ),
                        ],
                      ),
                    ),
                  )
                ]))));
  }
}
