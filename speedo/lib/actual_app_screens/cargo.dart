import 'package:dashed_line/dashed_line.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:speedon/AppThemes/colors.dart';
import 'package:speedon/AppThemes/fonts.dart';
import 'package:speedon/Athscreens/widgets/new_auth_SharedWidgets.dart';
import 'package:speedon/Athscreens/widgets/shared_widget.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

class cargo extends StatefulWidget {
  const cargo({super.key});

  @override
  State<cargo> createState() => _cargoState();
}

class _cargoState extends State<cargo> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController _customTypeController = TextEditingController();
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode _focusNode = FocusNode();
  List<MultiSelectItem<String>> _items = [
    MultiSelectItem('Clothing and Apparel', 'Clothing and Apparel 👕'),
    MultiSelectItem('Electronics', 'Electronics 📱'),
    MultiSelectItem('Home and Kitchen', 'Home and Kitchen 🏠 '),
    MultiSelectItem('Toys and Games', 'Toys and Games 🎮 '),
    MultiSelectItem('Automotive', 'Automotive🚗'),
    MultiSelectItem('others', 'Others'),
  ];
  List<String> _selectedItems = [];
  String _customType = '';
  late DateTime _selectedDate = DateTime.now();
  late TimeOfDay _selectedTime;
  DateTime _selectedValue = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
  }

  @override
  void dispose() {
    _customTypeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(10),
            child: Column(children: [
              SizedBox(
                height: 50,
              ),
              Row(children: [
                Positioned(
                  top: 15,
                  left: 10,
                  right: 5,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: secondaryBlue),
                    onPressed: () {
                      Navigator.pop(context); // Go back to previous screen
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                textfield_title_forth("Delivery Details", 18),
              ]),
              SizedBox(
                height: 25,
              ),
              xpoint(
                controller1,
                controller2,
              ),
              SizedBox(
                height: 25,
              ),
              buildTitle("Marchandise type "),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: MultiSelectDialogField(
                    dialogHeight: 400,
                    dialogWidth: 300,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(25)),
                    items: _items,
                    initialValue: _selectedItems,
                    title: Text("Select Marchandise"),
                    buttonText: Text("Select Marchandise"),
                    //listType: MultiSelectListType.LIST,
                    onConfirm: (selectedValues) {
                      setState(() {
                        _selectedItems = selectedValues
                            .map((value) => value.toString())
                            .toList();
                      });
                      if (selectedValues.contains('others')) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: AlertDialog(
                                    title: Text('Enter your marcahndise'),
                                    content: TextField(
                                      cursorColor: secondaryBlue,
                                      controller: _customTypeController,
                                      onChanged: (value) {
                                        setState(() {
                                          _customType = value;
                                        });
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: secondaryBlue),
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            _selectedItems.remove('others');
                                            _selectedItems.add(_customType);
                                            Navigator.of(context).pop();
                                          },
                                          child: Text(
                                            'Save',
                                            style:
                                                TextStyle(color: secondaryBlue),
                                          ))
                                    ],
                                  ));
                            });
                      }
                    },
                    chipDisplay: MultiSelectChipDisplay.none(),
                    selectedColor: secondaryOrange,
                    searchable: true,
                  ),
                ),
              ),
              _buildSelectedItems(),
              SizedBox(
                height: 25,
              ),
              buildTitle("Your depart Date "),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                height: 90,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      final date = DateTime.now().add(Duration(days: index));
                      final isSelected = date == _selectedDate;
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedDate = date;
                            });
                          },
                          child: Container(
                            width: 180,
                            height: 80,
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(40),
                              color:
                                  isSelected ? Colors.blue : Colors.transparent,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    '${date.day} ${_getMonthAbbreviation(date.month)}',
                                    style: AppFonts.primaryFont.copyWith(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    )),
                                SizedBox(height: 5),
                                Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 35,
                                      ),
                                      Text(
                                        'Time: ${_selectedTime.format(context)}',
                                        style: AppFonts.secondaryFont.copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w200,
                                            color: Colors.blueGrey),
                                      ),
                                      // SizedBox(
                                      // width: 5,
                                      //),
                                      GestureDetector(
                                        onTap: () => _selectTime(context),
                                        child: Icon(
                                          Icons.access_time,
                                          size: 20,
                                          color: secondaryBlue,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ));
                    }),
              ),
              SizedBox(
                height: 15,
              ),
              buildTitle('Add more details (Optional)'),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextField(
                  maxLines: 5,
                  cursorColor: mygrey,
                  decoration: InputDecoration(
                      hintStyle: AppFonts.secondaryFont
                          .copyWith(color: Colors.black54),
                      hintText:
                          'Arrival Time ect...                                     ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: _focusNode.hasFocus
                                  ? black
                                  : Colors.transparent)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(color: black))),
                  onTap: () {
                    if (!_focusNode.hasFocus) {
                      FocusScope.of(context).requestFocus(_focusNode);
                    }
                  },
                  onSubmitted: (value) {
                    _focusNode.unfocus();
                  },
                ),
              ),
              SizedBox(height: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DatePicker(
                    DateTime.now(),
                    initialSelectedDate: DateTime.now(),
                    selectionColor: primaryOrange,
                    selectedTextColor: white,
                    onDateChange: (date) {
                      // New date selected
                      setState(() {
                        _selectedValue = date;
                      });
                    },
                  ),
                  Text("Selected Date: $_selectedValue"),
                  TimePickerSpinnerPopUp(
                    mode: CupertinoDatePickerMode.date,
                    initTime: DateTime.now(),
                    minTime: DateTime.now().subtract(const Duration(days: 10)),
                    maxTime: DateTime.now().add(const Duration(days: 10)),
                    barrierColor:
                        Colors.black12, //Barrier Color when pop up show
                    minuteInterval: 1,
                    padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
                    cancelText: 'Cancel',
                    confirmText: 'OK',
                    pressType: PressType.singlePress,
                    timeFormat: 'dd/MM/yyyy',
                    //Customize your time widget
                    timeWidgetBuilder: (dateTime) {
                      // Calculate the current time
                      final currentTime = DateTime.now();

                      // Check if the dateTime is after or equal to the current time
                      final isSelectable = dateTime.isAfter(currentTime) ||
                          dateTime.isAtSameMomentAs(currentTime);

                      // Define the text color for selectable and non-selectable times
                      final textColor =
                          isSelectable ? Colors.black : Colors.grey;

                      // Return the time as a Text widget with the appropriate styling
                      return Text(
                        '${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(color: textColor),
                      );
                    },
                    onChange: (dateTime) {
                      // Implement your logic with select dateTime
                      print('Selected Time: $dateTime');
                    },
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              CustomButton(
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  onPressed: () {},
                  gradientColors: [primaryBlue, secondaryBlue]),
            ])));
  }

  Widget _buildSelectedItems() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Wrap(
              spacing: 6.0,
              runSpacing: 4.0,
              children: _selectedItems.map((item) {
                if (item == 'others') {
                  return Chip(
                    backgroundColor: Colors.orange.shade200,
                    label: Text(
                      _customType,
                      style: TextStyle(color: secondaryOrange),
                    ), // Display the custom type
                    // Customize the appearance here
                  );
                } else {
                  return Chip(
                    backgroundColor: Colors.orange.shade200,
                    label: Text(
                      item,
                      style: TextStyle(color: secondaryOrange),
                    ),
                    // Customize the appearance for other items here
                  );
                }
              }).toList(),
            )));
  }

  Future<void> _selectTime(BuildContext context) async {
    final now = DateTime.now();
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );

    if (picked != null) {
      if (_selectedDate.isBefore(now) ||
          (_selectedDate.isAtSameMomentAs(now)
          //picked.isBefore(TimeOfDay.fromDateTime(now)
          )) {
        // Show an error message if the selected time has already passed for today
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Invalid Time"),
              content: Text("Please select a time in the future for today."),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      } else {
        // Allow times in the future for selected date (tomorrow or beyond) or for today if time is in the future
        setState(() {
          _selectedTime = picked;
        });
      }
    }
  }

  String _getMonthAbbreviation(int month) {
    switch (month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'May';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Aug';
      case 9:
        return 'Sep';
      case 10:
        return 'Oct';
      case 11:
        return 'Nov';
      case 12:
        return 'Dec';
      default:
        return '';
    }
  }
}

Widget locationpoints(String imagepath) => Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(children: [
      SizedBox(
        height: 8,
      ),
      Image.asset(
        imagepath,
        height: 30,
        width: 30,
      ),
    ]));
Widget xpoint(
  TextEditingController controller1,
  TextEditingController controller2,
) =>
    Container(
      width: 350,
      child: Row(children: [
        SizedBox(
          width: 5,
        ),
        Column(
          children: [
            SizedBox(
              height: 25,
            ),
            locationpoints('assets/box2.png'),
            SizedBox(
                height: 60,
                child: DashedLine(
                  path: Path()
                    ..moveTo(0, 0)
                    ..cubicTo(-10, 30, -20, 20, -20, 100),
                  color: Colors.grey,
                )),
            locationpoints('assets/location2.png'),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pickup-Point',
              style: AppFonts.secondaryFont.copyWith(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 280,
              // decoration: BoxDecoration(
              //   color: Colors.grey[200],
              // borderRadius: BorderRadius.circular(15),
              //border: Border.all(color: Colors.grey.shade500)),
              child: location(controller1),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Drop Off-Point',
              style: AppFonts.secondaryFont.copyWith(
                color: black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: 280,
              //  decoration: BoxDecoration(
              //    color: Colors.grey[200],
              //  borderRadius: BorderRadius.circular(15),
              //border: Border.all(color: Colors.grey.shade500)),
              child: location(controller2),
            ),
          ],
        )
      ]),
    );

Widget location(TextEditingController controller) =>
    GooglePlaceAutoCompleteTextField(
      boxDecoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(25)),
      textEditingController: controller,
      googleAPIKey: apiKey,
      inputDecoration: InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide.none,
          //borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Search for a location',
        hintStyle:
            TextStyle(color: Colors.grey[400], fontStyle: FontStyle.italic),
        iconColor: secondaryOrange,
      ),
      debounceTime: 800,
      countries: ["in", "fr", "dz"],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (Prediction prediction) {
        print("placeDetails" + prediction.lng.toString());
      },
      itemClick: (Prediction prediction) {
        controller.text = prediction.description!;
        controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description!.length));
      },
      // if we want to make custom list item builder
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Icon(
                Icons.location_on,
                color: secondaryBlue,
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(child: Text("${prediction.description ?? ""}"))
            ],
          ),
        );
      },
      // if you want to add seperator between list items
      seperatedBuilder: Divider(),
      // want to show close icon
      isCrossBtnShown: true,
    );
Widget buildTitle(String title) => Row(
      children: [
        SizedBox(
          width: 15,
        ),
        textfield_title_forth(title, 18),
      ],
    );
