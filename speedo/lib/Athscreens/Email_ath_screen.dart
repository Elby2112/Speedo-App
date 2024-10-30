// ignore_for_file: unused_local_variable

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/Athscreens/username_auth_screen.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/other.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';

class EmailSetupScreen extends StatefulWidget {
  final String password;
  final phoneNum;

  EmailSetupScreen({required this.password, required this.phoneNum});

  @override
  _EmailSetupScreenState createState() => _EmailSetupScreenState();
}

class _EmailSetupScreenState extends State<EmailSetupScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailcontroller = TextEditingController();

  FocusNode _focusNode = FocusNode();

  String _errorMessage = '';

  @override
  void dispose() {
    emailcontroller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  // void onEmailChanged(String value) {
  //   validateEmail(value);
  // }

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
                                  "What's your Email Address ?", 18),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: Container(
                              width: 300,
                              child: TextFormField(
                                  validator: (value) {
                                    return value != null &&
                                            !EmailValidator.validate(value)
                                        ? "Enter a valid email"
                                        : null;
                                  },
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  focusNode: _focusNode,
                                  style: TextStyle(color: Colors.black),
                                  cursorColor: Colors.grey,
                                  decoration: InputDecoration(
                                    filled: true, // Enables background color
                                    fillColor: Colors.grey[200],
                                    hintText: 'Enter your Email',
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
                                      borderSide:
                                          BorderSide(color: Colors.black),
                                    ),
                                    contentPadding: EdgeInsets.all(16),
                                    suffixIcon: emailcontroller.text.isNotEmpty
                                        ? CircleIconButton(
                                            onPressed: () => {
                                              this.setState(() {
                                                emailcontroller.clear();
                                              })
                                            },
                                            size: 20,
                                            icon: Icons.clear,
                                            secondcolor: iconclear,
                                            gradientColors: [
                                              circlegrey,
                                              circlegrey
                                            ],
                                            firstcolor: circlegrey,
                                            onChanged: (value) {},
                                            keyboardType:
                                                TextInputType.emailAddress,
                                          )
                                        : null,
                                  ),
                                  onTap: () {
                                    if (!_focusNode.hasFocus) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNode);
                                    }
                                  },
                                  // onSubmitted: (value) {
                                  //   _focusNode.unfocus();
                                  // },
                                  controller: emailcontroller,
                                  onChanged: (val) {
                                    // validateEmail(val);
                                  },
                                  textInputAction: TextInputAction.done),
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
                              )
                            ],
                          ),
                          SizedBox(
                            height: 250,
                          ),
                          CustomButton(
                              child: Text(
                                "Confirm",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserSetupScreen(
                                              password: widget.password,
                                              Phone: widget.phoneNum,
                                              email: emailcontroller.text,
                                            )),
                                  );
                                }
                              },
                              gradientColors: [primaryBlue, secondaryBlue]),
                        ]),
                      )))
                ]))));
  }

  // void validateEmail(String val) {
  //   if (val.isEmpty) {
  //     setState(() {
  //       _errorMessage = "Email can not be empty";
  //     });
  //   } else if (!EmailValidator.validate(val, true)) {
  //     setState(() {
  //       _errorMessage = "Invalid Email Address";
  //     });
  //   } else {
  //     setState(() {
  //       _errorMessage = "";
  //     });
  //   }
  // }
}
