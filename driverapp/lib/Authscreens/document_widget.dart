import 'package:driverapp/AppThemes/colors.dart';
import 'package:driverapp/AppThemes/fonts.dart';
import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:flutter/material.dart';

Widget documenttextfield(FocusNode myfocusnode, VoidCallback onpressed,
        TextEditingController mycontroller, String hinttext) =>
    Container(
      width: 320,
      child: TextFormField(
          decoration: InputDecoration(
            labelText: hinttext,
            labelStyle: TextStyle(color: Colors.grey[600]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: myfocusnode.hasFocus ? Colors.black : Colors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.all(16),
            suffixIcon: IconButton(
                icon: Icon(
                  Icons.attach_file,
                  color: secondaryGreen,
                ),
                onPressed: onpressed),
          ),
          readOnly: true,
          controller: mycontroller),
    );

Widget truckType(
  String imagePath,
  String text,
  VoidCallback ontap,
  bool selected,
) {
  return GestureDetector(
      onTap: ontap,
      child: Container(
          width: 100,
          height: 120,
          decoration: BoxDecoration(
              border: Border.all(color: selected ? primaryGrass : white),
              borderRadius: BorderRadius.circular(15)),
          child: Center(
              child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Image.asset(
              imagePath,
              width: 70,
              height: 70,
            ),
            SizedBox(
              height: 5,
            ),
            Text(text, style: AppFonts.secondaryFont)
          ]))));
}

Widget title(String title) => Row(
      children: [
        SizedBox(
          width: 15,
        ),
        textfield_title_forth(title),
      ],
    );
