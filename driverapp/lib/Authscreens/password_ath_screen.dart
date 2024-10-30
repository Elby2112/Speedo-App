// ignore_for_file: unused_local_variable

import 'package:driverapp/Authscreens/personal_information_screen.dart';
import 'package:flutter/material.dart';

import 'package:password_strength/password_strength.dart';
import 'package:password_text_field/password_text_field.dart';
import 'package:driverapp/AppThemes/colors.dart';

import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:driverapp/widgets/shared_widget.dart';
// import 'package:speedon/user_data.dart';

class PasswordSetupScreen extends StatefulWidget {
 // final String PhoneNumber;


  @override
  _PasswordSetupScreenState createState() => _PasswordSetupScreenState();
}

class _PasswordSetupScreenState extends State<PasswordSetupScreen> {
  TextEditingController passwordsetupcontroller = TextEditingController();
  double _passwordStrength = 0.0;
  FocusNode _focusNode = FocusNode();

  void _updatePasswordStrength(String password) {
    setState(() {
      _passwordStrength = estimatePasswordStrength(password);
    });
  }

  Color _getProgressBarColor(double strength) {
    if (strength >= 0.75) {
      return Colors.green;
    } else if (strength >= 0.5) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
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
                                  "Time to create your Password"),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            child: Theme(
                                data: ThemeData(
                                    textSelectionTheme: TextSelectionThemeData(
                                  cursorColor: Colors.grey,
                                )),
                                child: PasswordTextField(
                                  controller: passwordsetupcontroller,
                                  focusNode: _focusNode,
                                  style: TextStyle(
                                    color: black,
                                  ),
                                  decoration: InputDecoration(
                                    suffixIconColor: secondaryGreen,
                                    filled: true,
                                    fillColor: Colors.grey[200],
                                    hintText: 'Enter your password',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[600]),
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
                                      borderSide: BorderSide(color: black),
                                    ),
                                    contentPadding: EdgeInsets.all(16),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  onTap: () {
                                    if (!_focusNode.hasFocus) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode);
                                    }
                                  },
                                  onSubmitted: (value) {
                                    _focusNode.unfocus();
                                  },
                                  onChanged: (password) {
                                    _updatePasswordStrength(password);
                                  },
                                )),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            width: 290,
                            child: LinearProgressIndicator(
                              borderRadius: BorderRadius.circular(15),
                              value:
                                  _passwordStrength, // Set the value to display progress
                              valueColor: AlwaysStoppedAnimation<Color>(
                                _getProgressBarColor(_passwordStrength),
                              ),
                              backgroundColor:
                                  Colors.grey[300], // Background color
                              minHeight:
                                  10, // Adjust the height of the progress bar
                              semanticsLabel: 'Password Strength',
                              semanticsValue:
                                  '${(_passwordStrength * 100).toInt()}%', // Accessibility label
                            ),
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
                                      "8 characters minimum")),
                            ],
                          ),
                          SizedBox(
                            height: 250,
                          ),
                          CustomButton(
                              text: "Confirm",
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DriverInformation(
                                              password:
                                                  passwordsetupcontroller.text,
                                              //phoneNum: widget.PhoneNumber,
                                            )));

                                // signUpData.password = passwordsetupcontroller.text;
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => EmailSetupScreen(password:  passwordsetupcontroller.text, phoneNum: widget.PhoneNumber,)),
                                // );
                                // signUpData.password =
                                //     passwordsetupcontroller.text;
                              },
                              gradientColors: [primaryGreen, secondaryGreen]),
                        ]),
                      )))
                ]))));
  }
}
