import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({super.key});

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
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
                    alignment: Alignment(0, 1.1),
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
                          textfield_title_third(
                              "Let's reset your password !", 25),
                        ],
                      ),
                      SizedBox(
                        height: 60,
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
                            child: textfield_title_forth(
                                "Enter your Email address to reset your password",
                                14),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        child: TextFormField(
                            focusNode: _focusNode,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                              filled: true, // Enables background color
                              fillColor: Colors.grey[200],
                              hintText: 'Enter your Email',
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
                              // suffixIcon: emailcontroller.text.isNotEmpty
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
                              //         onChanged: (value) {},
                              //         keyboardType:
                              //             TextInputType.emailAddress,
                              //       )
                              //     : null,
                            ),
                            onTap: () {
                              if (!_focusNode.hasFocus) {
                                FocusScope.of(context).requestFocus(_focusNode);
                              }
                            },
                            // onSubmitted: (value) {
                            //   _focusNode.unfocus();
                            // },

                            onChanged: (val) {
                              // validateEmail(val);
                            },
                            textInputAction: TextInputAction.done),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          width: 150,
                          child: Text(
                            "Reset Password",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          onPressed: () {},
                          gradientColors: [primaryBlue, secondaryBlue]),
                    ])),
                  )
                ]))));
  }
}
