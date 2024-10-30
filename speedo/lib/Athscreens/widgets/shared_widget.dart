import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/AppThemes/logo.dart';
import 'package:speedon/Athscreens/widgets/other.dart';

Widget profileHeader(BuildContext context) => Container(
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
                fontSize: 24, fontWeight: FontWeight.bold, color: white),
          ),
          SizedBox(
            width: 200,
          ),
          Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 79, 148, 230),
                  borderRadius: BorderRadius.circular(10)),
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
              borderRadius: BorderRadius.circular(25), child: ProfilePic()),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        'Elby',
        style: AppFonts.primaryFont
            .copyWith(color: white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    ]));

Widget profileButton(IconData icon, String text, VoidCallback onpressed) =>
    Container(
        height: 50,
        width: 350,
        child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 243, 244, 249),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: Color.fromARGB(255, 79, 148, 230),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  text,
                  style:
                      AppFonts.primaryFont.copyWith(color: black, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ));

Widget textfield_title(
  String title,
) =>
    Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.primaryFont
          .copyWith(color: black, fontSize: 18, fontWeight: FontWeight.w500),
    );

Widget textfield_secondary_title(String title) => Text(
      title,
      textAlign: TextAlign.left,
      style: AppFonts.secondaryFont.copyWith(
          color: littleTitles, fontSize: 14, fontWeight: FontWeight.bold),
    );

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final List<Color> gradientColors;
  final double borderRadius;
  final double width;
  final double height;
  final child;
  CustomButton({
    required this.child,
    required this.onPressed,
    required this.gradientColors,
    this.borderRadius = 25.0,
    this.width = 300.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      ),
    );
  }
}

enum CustomTextFieldType {
  Number,
  Password,
  Text,
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final CustomTextFieldType type;

  CustomTextField({required this.hintText, required this.type});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
  TextEditingController get controller {
    return controller;
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[200],
      ),
      child: TextField(
        controller: _controller,
        focusNode: _focusNode,
        style: TextStyle(color: Colors.black),
        cursorColor: Colors.grey,
        obscureText: widget.type == CustomTextFieldType.Password,
        keyboardType: widget.type == CustomTextFieldType.Number
            ? TextInputType.number
            : TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: _focusNode.hasFocus ? Colors.black : Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.black),
          ),
          contentPadding: EdgeInsets.all(16),
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
