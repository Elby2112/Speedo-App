import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/AppThemes/logo.dart';
import 'package:driverapp/Authscreens/document_widget.dart';
import 'package:driverapp/Authscreens/driver_info.dart';
import 'package:driverapp/Authscreens/snackbar.dart';
import 'package:driverapp/Authscreens/vehicle_information_screen.dart';
import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:driverapp/widgets/other.dart';
import 'package:driverapp/widgets/shared_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/AppThemes/colors.dart';
import 'package:driverapp/AppThemes/fonts.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class DriverInformation extends StatefulWidget {
  final String password;
  // final phoneNum;
  const DriverInformation({
    super.key,
    required this.password,
    // this.phoneNum,
    // required this.password, this.phoneNum
  });

  @override
  // ignore: library_private_types_in_public_api
  _DriverInformationState createState() => _DriverInformationState();
}

class _DriverInformationState extends State<DriverInformation> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController uploadFileController = TextEditingController();
  TextEditingController adresscontroller = TextEditingController();
  FocusNode _focusNode = FocusNode();
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  String _errorMessage = '';
  File? selectedDocument;

  bool cargoSelected = false;
  bool towSelected = false;
  FilePickerResult? result;
  FilePickerResult? myresult;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  String? imageUrl;
  String? documentUrl;
  String? role;
  void selectCargo() {
    setState(() {
      cargoSelected = true;
      towSelected = false;
      role = 'Cargo';
    });
  }

  void selectTow() {
    setState(() {
      cargoSelected = false;
      towSelected = true;
      role = 'Tow';
    });
  }

  @override
  void initState() {
    super.initState();
    final driverInfo = context.read<DriverInfo>();
    emailcontroller.text = driverInfo.email;
    firstNameController.text = driverInfo.firstName;
    lastNameController.text = driverInfo.lastName;
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    uploadFileController.dispose();
    adresscontroller.dispose();
    _focusNode1.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void onEmailChanged(String value) {
    validateEmail(value);
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
                child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(25),
                //boxShadow: [
                //BoxShadow(
                //color: Colors.grey.withOpacity(0.2),
                //spreadRadius: 5,
                //blurRadius: 7,
                //offset: Offset(0, 3),
                //),
                //],
              ),
              width: screenWidth - 40,
              height: screenHeight - 40,
              child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              //Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.arrow_back),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Driver Informations',
                            style: AppFonts.primaryFont.copyWith(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Stack(children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: ClipRect(
                                  clipBehavior: Clip.antiAlias,
                                  child: SizedBox(
                                      height: 130,
                                      width: 130,
                                      child: pickedfile != null
                                          ? Image.file(
                                              fileToDisplay!,
                                              height: 130,
                                              width: 130,
                                              fit: BoxFit.cover,
                                            )
                                          : ProfilePic())

                                  // ProfilePic(),
                                  // child: Image.asset(
                                  //   'assets/profile_img.jpg',
                                  //   width: 130.0,
                                  //   height: 130.0,
                                  //   fit: BoxFit.cover,
                                  // ),
                                  )),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: GestureDetector(
                                onTap: () {
                                  SelectImage();
                                },
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  margin: EdgeInsets.only(
                                      right: 10.0, bottom: 10.0),
                                  decoration: BoxDecoration(
                                    color: primaryGrass,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: isLoading
                                      ? CircularProgressIndicator()
                                      : Center(
                                          child: Icon(
                                            Icons.camera_alt,
                                            color: Colors.white,
                                          ),
                                        ),
                                )),
                          )
                        ]),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          textfield_title_forth('First Name'),
                          SizedBox(
                            width: 80,
                          ),
                          textfield_title_forth('Last Name'),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          CustomTextField2(
                            hintText: 'First Name',
                            controller: firstNameController,
                            width: 150,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CustomTextField2(
                            hintText: 'Last Name',
                            controller: lastNameController,
                            width: 150,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      title('What is your email address ?'),
                      SizedBox(height: 10),
                      Container(
                        width: 320,
                        child: TextField(
                          focusNode: _focusNode,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
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
                                    gradientColors: [circlegrey, circlegrey],
                                    firstcolor: circlegrey,
                                    onChanged: null,
                                    keyboardType: TextInputType.none,
                                  )
                                : null,
                            hintText: 'Enter your Email',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: _focusNode.hasFocus
                                    ? Colors.black
                                    : Colors.transparent,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
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
                            //         gradientColors: [circlegrey, circlegrey],
                            //         firstcolor: circlegrey,
                            //         onChanged: (value) {},
                            //       )
                            //     : null,
                          ),
                          onTap: () {
                            if (!_focusNode.hasFocus) {
                              FocusScope.of(context).requestFocus(_focusNode);
                            }
                          },
                          onSubmitted: (value) {
                            _focusNode.unfocus();
                          },
                          controller: emailcontroller,
                          onChanged: (val) {
                            validateEmail(val);
                          },
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
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
                      title('Driver Lisence'),
                      SizedBox(
                        height: 10,
                      ),
                      documenttextfield(_focusNode1, () {
                        pickAndSetFile(
                            controller: uploadFileController,
                            focusNode: _focusNode1);
                      }, uploadFileController, 'Upload Document'),
                      SizedBox(
                        height: 15,
                      ),
                      title('What is your Adress'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 320,
                        child: TextField(
                          controller: adresscontroller,
                          focusNode: _focusNode2,
                          style: TextStyle(color: black),
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.location_pin,
                              color: secondaryGreen,
                            ),
                            hintText: 'Setup your Adress',
                            hintStyle: TextStyle(color: Colors.grey[600]),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(
                                    color: _focusNode2.hasFocus
                                        ? black
                                        : Colors.transparent)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: black),
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      title('What is your role?'),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                selectCargo();
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      cargoSelected ? white : black,
                                  backgroundColor:
                                      cargoSelected ? primaryGrass : white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  side: BorderSide(
                                    color: cargoSelected ? primaryGrass : black,
                                  )),
                              child: Text(
                                'Cargo Transport',
                                style: AppFonts.secondaryFont
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 50,
                            width: 150,
                            child: ElevatedButton(
                              onPressed: () {
                                selectTow();
                              },
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: towSelected ? white : black,
                                  backgroundColor:
                                      towSelected ? primaryGrass : white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  side: BorderSide(
                                    color: towSelected ? primaryGrass : black,
                                  )),
                              child: Text(
                                'Tow and Repair',
                                style: AppFonts.secondaryFont
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomButton(
                          width: 320,
                          text: 'Submit',
                          onPressed: () async {
                            UploadImage();
                            UploadDocument();
                            Future<void> uploadOperations;
                            uploadOperations = Future.wait<void>(
                                [UploadImage(), UploadDocument()]);
                            await uploadOperations;

                            registerDriver(
                              emailcontroller.text,
                              widget.password,
                              firstNameController.text,
                              lastNameController.text,
                              imageUrl!,
                              documentUrl!,
                              role!,
                            );
                            showSnackBar(
                                context, "Account created successfully");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VehicleInformation()),
                            );
                          },
                          gradientColors: [primaryGreen, secondaryGreen]),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  )),
            ))));
  }

  void validateEmail(String val) {
    if (val.isEmpty) {
      setState(() {
        _errorMessage = "Email can not be empty";
      });
    } else if (!EmailValidator.validate(val, true)) {
      setState(() {
        _errorMessage = "Invalid Email Address";
      });
    } else {
      setState(() {
        _errorMessage = "";
      });
    }
  }

  void SelectImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());
        print('Filename ' + _fileName!);
      }
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> UploadImage() async {
    try {
      setState(() {
        isLoading = true;
      });
      if (pickedfile == null) {
        print('No image selected.');
        return;
      }
      final path = 'files/${pickedfile!.name}';
      final file = File(pickedfile!.path!);
      final ref = FirebaseStorage.instance.ref().child(path);
      await ref.putFile(file);
      print('Image uploaded successfully.');
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl;
      });
      print("Donload URL : $downloadUrl");
      return;
    } catch (e) {
      print('Error Uploadig image" $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> pickAndSetFile({
    required TextEditingController controller,
    required FocusNode focusNode,
  }) async {
    try {
      myresult = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png',
          'pdf',
          'doc',
          'docx',
          'txt',
          '...'
        ],
      );

      if (myresult != null && myresult!.files.isNotEmpty) {
        setState(() {
          selectedDocument = File(myresult!.files.single.path!);
          controller.text = myresult!.files.single.name;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> UploadDocument() async {
    try {
      if (myresult == null || myresult!.files.isEmpty) {
        print('No document selected.');
        return;
      }

      setState(() {
        isLoading = true;
      });

      final selectedFile = myresult!.files.single;
      final path = 'documents/${selectedFile.name}';
      final file = File(selectedFile.path!);
      final ref = FirebaseStorage.instance.ref().child(path);

      await ref.putFile(file);

      print('Document uploaded successfully.');
      String downloadUrl = await ref.getDownloadURL();
      setState(() {
        documentUrl = downloadUrl;
      });
      print('Download URL: $downloadUrl');
      return;
    } catch (e) {
      print('Error uploading document: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  void registerDriver(
    String email,
    // String num,
    String password,
    String firstname,
    String lastname,
    String imageUrl,
    String documentUrl,
    String role,
  ) async {
    setState(() {
      isLoading = true;
    });

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      CollectionReference drivers =
          FirebaseFirestore.instance.collection('Drivers');
      await drivers.doc(credential.user!.uid).set({
        // 'phoneNumber': num,
        'email': email,
        'firstName': firstname,
        'lastName': lastname,
        'imageUrl': imageUrl,
        'documentUrl': documentUrl,
        'role': role,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showSnackBar(context, 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showSnackBar(context, 'The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    setState(() {
      isLoading = false;
    });
  }
}
