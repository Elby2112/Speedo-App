// ignore_for_file: unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pinput/pinput.dart';
import 'package:driverapp/AppThemes/colors.dart';
import 'package:driverapp/AppThemes/fonts.dart';
import 'package:driverapp/AppThemes/logo.dart';
import 'package:driverapp/widgets/other.dart';

import 'package:driverapp/widgets/shared_widget.dart';

import 'package:driverapp/Authscreens/code_verif_screen.dart';
import 'package:driverapp/Authscreens/password_ath_screen.dart';

import 'package:driverapp/Authscreens/number_verif_screen.dart';

Widget buildPinPut() {
  return Pinput(
    onCompleted: (pin) => print(pin),
  );
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      //color: Color.fromRGBO(28, 53, 74, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    color: Color.fromARGB(244, 213, 207, 207),
    border: Border.all(color: Color.fromARGB(107, 245, 245, 245), width: 1),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  color: Color.fromARGB(107, 245, 245, 245),
  border: Border.all(color: Color.fromRGBO(88, 124, 159, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Color.fromARGB(255, 70, 161, 251),
  ),
);

Widget header(
  BuildContext context,
  double height,
  double width,
  String title, {
  bool showBackButton = false,
}) =>
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0.8, -0.8),
              radius: 2,
              colors: [primaryGreen, secondaryGreen])),
      child: Stack(
        children: [
          Positioned.fill(
            top: 0,
            child: Image.asset(
              'assets/logo/Picture1.png',
              fit: BoxFit.cover,
            ),
          ),
          if (showBackButton)
            Positioned(
              top: 20,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Go back to previous screen
                },
              ),
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                auth_screen_logo(),
                SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

Widget textfield_title_third(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont.copyWith(
          color: primaryGrass, fontSize: 31, fontWeight: FontWeight.w900),
    );

Widget textfield_title_forth(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont
          .copyWith(color: black, fontSize: 18, fontWeight: FontWeight.w700),
    );

Widget auth_box(Widget child) => Container(
    height: 580,
    width: 350,
    decoration:
        BoxDecoration(color: boxcolor, borderRadius: BorderRadius.circular(20)),
    child: child);

class CustomTextField2 extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final double width;
  final IconData? prefixIcon;

  const CustomTextField2({
    required this.hintText,
    this.controller,
    this.width = 300.0,
    this.prefixIcon,
  });

  @override
  _CustomTextField2State createState() => _CustomTextField2State();
}

class _CustomTextField2State extends State<CustomTextField2> {
  late TextEditingController _controller;
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: TextField(
        
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: _controller.text.isNotEmpty
              ? CircleIconButton(
                  onPressed: () => {
                    this.setState(() {
                      _controller.clear();
                    })
                  },
                  size: 20,
                  icon: Icons.clear,
                  secondcolor: iconclear,
                  gradientColors: [circlegrey, circlegrey],
                  firstcolor: circlegrey,
                  onChanged: null,
                  keyboardType: TextInputType.none,
                )
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: _focusNode.hasFocus ? Colors.black : Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.all(16),
        ),
        onChanged: (value) {
          setState(() {});
        },
        onTap: () {
          if (!_focusNode.hasFocus) {
            FocusScope.of(context).requestFocus(_focusNode);
          }
        },
        onSubmitted: (value) {
          _focusNode.unfocus();
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}



// class LoginWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         children: [
//           SizedBox(
//             height: 30,
//           ),
//           Row(
//             children: [
//               SizedBox(width: 30),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: textfield_title('Username or Email'),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           CustomTextField2(
//               hintText: "Username / Email ", type: CustomTextFieldType.Text),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             children: [
//               SizedBox(width: 30),
//               Align(
//                 alignment: Alignment.topLeft,
//                 child: textfield_title('Password'),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           CustomTextField(
//               hintText: 'Enter password', type: CustomTextFieldType.Password),
//           SizedBox(
//             height: 15,
//           ),
//           Row(
//             children: [
//               SizedBox(
//                 width: 200,
//               ),
//               textfield_secondary_title('Forget Password?')
//             ],
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           CustomButton(
//               text: 'Connexion ',
//               onPressed: () {
//                   Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => PassAuth()),
//                 );
//               },
//               gradientColors: [primaryBlue, secondaryBlue]),
//           SizedBox(
//             height: 30,
//           ),
//           Center(
//             child: textfield_secondary_title('Or create an account'),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           CustomButton(
//               text: 'Inscription',
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NumberVerif()),
//                 );
//               },
//               gradientColors: ([primaryOrange, secondaryOrange])),
//           CustomButton(
//             text: "Confirm",
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//         ],
//       ),
//     );
//   }
// }



// class NumberVerifWidget extends StatefulWidget {
//   const NumberVerifWidget({super.key});


//   static String verify="";

//   @override
//   State<NumberVerifWidget> createState() => _NumberVerifWidgetState();
// }



// class _NumberVerifWidgetState extends State<NumberVerifWidget> {
//   TextEditingController _controller = TextEditingController();

//   FocusNode _focusNode = FocusNode();
//   var phone = '';

//   @override
//   void dispose() {
//     _controller.dispose();
//     _focusNode.dispose();
//     super.dispose();
//   }

//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_third("Hello, user !"),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_forth("Can we have your phone number? "),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         IntlPhoneField(
//           decoration: InputDecoration(
//             labelText: 'Phone Number',
//             suffixIcon: CircleIconButton(
//               onPressed: () {
//                 setState(() {
//                   _controller.clear();
//                 });
//               },
//               size: 20,
//               icon: Icons.clear,
//               secondcolor: iconclear,
//               gradientColors: [circlegrey, circlegrey],
//               firstcolor: circlegrey,
//               onChanged: null,
//               keyboardType: TextInputType.none,
//             ),
//             fillColor: Colors.grey[300],
//             border: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: _focusNode.hasFocus ? Colors.black : Colors.transparent,
//               ),
//               borderRadius: BorderRadius.circular(10),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             contentPadding: EdgeInsets.all(16),
//           ),
//           cursorColor: black,
//           keyboardType: TextInputType.phone,
//           initialCountryCode: 'IN',
//           onChanged: (value) {
//             phone = value.completeNumber;
//           },
//           controller: _controller,
//           focusNode: _focusNode,
//           onSubmitted: (value) {
//             _focusNode.unfocus();
//           },
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             Expanded(
//                 child: textfield_secondary_title(
//                     "By clicking i acknowledge having the speedo privacy policy")),
//           ],
//         ),
//         SizedBox(
//           height: 220,
//         ),
//         CustomButton(
//             text: "Confirm",
//             onPressed: () async {
//               await FirebaseAuth.instance.verifyPhoneNumber(
//                 phoneNumber: '${phone}',
//                 verificationCompleted: (PhoneAuthCredential credential) {},
//                 verificationFailed: (FirebaseAuthException e) {},
//                 codeSent: (String verificationId, int? resendToken) {
//                   NumberVerifWidget.verify=verificationId;
//                   Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => numberVerifCode()),
//               );
//                 },
//                 codeAutoRetrievalTimeout: (String verificationId) {},
//               );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//       ]),
//     );
//   }
// }


// class CodeVerifWidget extends StatefulWidget {
//   const CodeVerifWidget({super.key});

//   @override
//   State<CodeVerifWidget> createState() => _CodeVerifWidgetState();
// }



// class _CodeVerifWidgetState extends State<CodeVerifWidget> {
//   var code="";
//   final FirebaseAuth auth =FirebaseAuth.instance;
//   @override
//   Widget build(BuildContext context) {
    
//     return Container(
//       child: Column(children: [
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_third("Is that you ?"),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 20,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_forth("Let's verify you by SMS "),
//           ],
//         ),
//         SizedBox(
//           height: 40,
//         ),
//         Pinput(
//           onChanged: (value) {
//             code=value;
//           },
//           defaultPinTheme: defaultPinTheme,
//           focusedPinTheme: focusedPinTheme,
//           submittedPinTheme: submittedPinTheme,
//           pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//           showCursor: true,
//           onCompleted: (pin) => print(pin),
//           length: 6,
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         textfield_secondary_title(
//             "Type the code we just sent you in +213652487941 "),
//         SizedBox(
//           height: 180,
//         ),
//         CustomButton(
//             text: "Verify",
//             onPressed: () async {
//               try{
//                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
//                   verificationId: NumberVerifWidget.verify, smsCode: code);

//               // Sign the user in (or link) with the credential
//               await auth.signInWithCredential(credential);
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => PassAuth()),
//               );
//               }

//               catch(e){
//                 print("wrong otp");
//               }
             
//               // Navigator.push(
//               //   context,
//               //   MaterialPageRoute(builder: (context) => PassAuth()),
//               // );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//       ]),
//     );
//   }
// }



// class PassAuthWidgit extends StatelessWidget {
//   const PassAuthWidgit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_forth("Time to create your password"),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             CustomTextField(
//                 hintText: "Password", type: CustomTextFieldType.Password),
//           ],
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             Expanded(child: textfield_secondary_title("8 characters minimum")),
//           ],
//         ),
//         SizedBox(
//           height: 300,
//         ),
//         CustomButton(
//             text: "Confirm",
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => EmailAuth()),
//               );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//       ]),
//     );
//   }
// }



// class EmailAuthWidgit extends StatelessWidget {
//   const EmailAuthWidgit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_forth("What's your email address ?"),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             CustomTextField(hintText: "Email", type: CustomTextFieldType.Text),
//           ],
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             Expanded(
//                 child: textfield_secondary_title(
//                     "You will receive your ride receipts and anything else that you agree on later.")),
//           ],
//         ),
//         SizedBox(
//           height: 290,
//         ),
//         CustomButton(
//             text: "Confirm",
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => UserAuth()),
//               );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//       ]),
//     );
//   }
// }



// class UserAuthWidgit extends StatelessWidget {
//   const UserAuthWidgit({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(children: [
//         SizedBox(
//           height: 30,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             textfield_title_forth("What should we call you ?"),
//           ],
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 15,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             CustomTextField(
//                 hintText: "Username", type: CustomTextFieldType.Text),
//           ],
//         ),
//         SizedBox(
//           height: 15,
//         ),
//         Row(
//           children: [
//             SizedBox(
//               width: 25,
//             ),
//             Align(
//               alignment: Alignment.centerLeft,
//             ),
//             Expanded(
//                 child: textfield_secondary_title(
//                     "You will receive your ride receipts and anything else that you agree on later.")),
//           ],
//         ),
//         SizedBox(
//           height: 300,
//         ),
//         CustomButton(
//             text: "Confirm",
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomeScreen()),
//               );
//             },
//             gradientColors: [primaryBlue, secondaryBlue]),
//       ]),
//     );
//   }
// }
