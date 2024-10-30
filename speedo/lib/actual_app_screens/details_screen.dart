import 'package:flutter/material.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';
import 'package:speedon/actual_app_screens/map_screen.dart';


class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  DateTime dateTime = DateTime(2022, 12, 24, 5, 30);
  String dropdownValue = 'Package';
  @override
  Widget build(BuildContext context) {
    final hours = dateTime.hour.toString().padLeft(2, '0');
    final minutes = dateTime.minute.toString().padLeft(2, '0');
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Positioned(
                  top: 15,
                  left: 10,
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: primaryBlue),
                    onPressed: () {
                      Navigator.pop(context); 
                    },
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                textfield_title_forth("Delivery Details", 18),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    textfield_title_forth("Your depart location ", 18),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
           
              ],
            ),
           
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                textfield_title_forth("Your destination location ", 18),
              ],
            ),
            SizedBox(
              height: 15,
            ),
          
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                textfield_title_forth("Marchandise type ", 18),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 5, 80, 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color.fromARGB(136, 40, 32, 32)),
                    borderRadius: BorderRadius.circular(10),
                    color: mygrey,
                  ),
                  child: DropdownButton(
                    value: dropdownValue,
                    icon: Icon(
                      Icons.arrow_circle_down_outlined,
                    ),
                    style: const TextStyle(
                        color: black,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                    // underline: Container(
                    //   height: 2,
                    //   color: black,
                    // ),

                    items: const [
                      DropdownMenuItem<String>(
                        child: Text('Package'),
                        value: 'Package',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Drugs'),
                        value: 'Drugs',
                      ),
                      DropdownMenuItem<String>(
                        child: Text('Others'),
                        value: 'Others',
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                textfield_title_forth("Your Depart time", 18),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final date = await pickDate();
                    if (date == null) return;
                    final newDateTime = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day,
                      dateTime.hour,
                      dateTime.minute,
                    );
                    setState(() => dateTime = newDateTime);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mygrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(20, 10, 20, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                    style: TextStyle(fontSize: 19, color: black),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final time = await pickTime();
                    if (time == null) return;
                    final newDateTime = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day,
                      time.hour,
                      time.minute,
                    );
                    setState(() => dateTime = newDateTime);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mygrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(15, 10, 15, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "$hours:$minutes",
                    style: TextStyle(fontSize: 19, color: black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                textfield_title_forth("Your Arrival time", 18),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final date = await pickDate();
                    if (date == null) return;
                    final newDateTime = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day,
                      dateTime.hour,
                      dateTime.minute,
                    );
                    setState(() => dateTime = newDateTime);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mygrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(20, 10, 20, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "${dateTime.year}/${dateTime.month}/${dateTime.day}",
                    style: TextStyle(fontSize: 19, color: black),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                  onPressed: () async {
                    final time = await pickTime();
                    if (time == null) return;
                    final newDateTime = DateTime(
                      dateTime.year,
                      dateTime.month,
                      dateTime.day,
                      time.hour,
                      time.minute,
                    );
                    setState(() => dateTime = newDateTime);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(mygrey),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.fromLTRB(15, 10, 15, 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                  ),
                  child: Text(
                    "$hours:$minutes",
                    style: TextStyle(fontSize: 19, color: black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            CustomButton(
                child: Text(
                  "Confirm",
                  style: TextStyle(color: white, fontSize: 15),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen()),
                  );
                },
                gradientColors: [primaryBlue, secondaryBlue]),
          ],
        ),
      ),
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );
  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: dateTime.hour, minute: dateTime.minute),
      );
}
