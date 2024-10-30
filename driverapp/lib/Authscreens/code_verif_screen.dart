import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:driverapp/AppThemes/colors.dart';
// import 'package:speedo/Authentification/Shared/widgets.dart';
// import 'package:speedo/Authentification/Signup/password_setup.dart';
// import 'package:speedo/Authentification/Signup/phone_auth.dart';
import 'package:driverapp/Authscreens/number_verif_screen.dart';
import 'package:driverapp/Authscreens/password_ath_screen.dart';
import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:driverapp/widgets/shared_widget.dart';

class CodeVerificationScreen extends StatefulWidget {
  final String phoneNum;

  CodeVerificationScreen({required this.phoneNum});
  @override
  _CodeVerificationScreenState createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {

  var code = "";
  final FirebaseAuth auth = FirebaseAuth.instance;
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
                      child: auth_box(Container(
                        child: Column(children: [
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
                              textfield_title_third("Is that you ?"),
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
                              textfield_title_forth("Let's verify you by SMS "),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Pinput(
                            onChanged: (value) {
                              code = value;
                            },
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                            showCursor: true,
                            onCompleted: (pin) => print(pin),
                            length: 6,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          textfield_secondary_title(
                              "Type the code we just sent you in +213652487941 "),
                          SizedBox(
                            height: 180,
                          ),
                          CustomButton(
                              text: "Verify",
                              onPressed: () async {
                                try {
                                  PhoneAuthCredential credential =
                                      PhoneAuthProvider.credential(
                                          verificationId:
                                              PhoneAuthScreen.verify,
                                          smsCode: code);

                                  // Sign the user in (or link) with the credential
                                  await auth.signInWithCredential(credential);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PasswordSetupScreen(
                                              //PhoneNumber: widget.phoneNum,
                                              )),
                                  );
                                } catch (e) {
                                  print("wrong otp");
                                }

                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(builder: (context) => PassAuth()),
                                // );
                              },
                              gradientColors: [primaryGreen, secondaryGreen]),
                        ]),
                      )))
                ]))));
  }
}
