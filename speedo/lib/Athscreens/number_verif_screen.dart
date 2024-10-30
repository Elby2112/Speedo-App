import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/Athscreens/code_verif_screen.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/other.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';

class PhoneAuthScreen extends StatefulWidget {
  static String verify = "";
  @override
  _PhoneAuthScreenState createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();

  var phone = '';

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = 250;
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
                    child: auth_box(Column(children: [
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          textfield_title_third("Hello, user !", 31),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          textfield_title_forth(
                              "Can we have your phone number? ", 18),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        child: IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: 'Phone Number',
                            suffixIcon: CircleIconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.clear();
                                });
                              },
                              size: 20,
                              icon: Icons.clear,
                              secondcolor: iconclear,
                              gradientColors: [circlegrey, circlegrey],
                              firstcolor: circlegrey,
                              onChanged: null,
                              keyboardType: TextInputType.none,
                            ),
                            fillColor: Colors.grey[300],
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.all(16),
                          ),
                          cursorColor: black,
                          keyboardType: TextInputType.phone,
                          initialCountryCode: 'DZ',
                          onChanged: (value) {
                            phone = value.completeNumber;
                          },
                          controller: _controller,
                          focusNode: _focusNode,
                          onSubmitted: (value) {
                            _focusNode.unfocus();
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          Expanded(
                              child: textfield_secondary_title(
                                  "By clicking i acknowledge having the speedo privacy policy")),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      CustomButton(
                          child: Text(
                            "Confirm",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phone,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                PhoneAuthScreen.verify = verificationId;
                                // signUpData.phoneNumber = phone;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CodeVerificationScreen(
                                      phoneNum: _controller.text,
                                    ),
                                  ),
                                );
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          },
                          gradientColors: [primaryBlue, secondaryBlue]),
                    ])),
                  )
                ]))));
  }
}
