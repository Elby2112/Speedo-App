import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:driverapp/Authscreens/document_widget.dart';
import 'package:driverapp/widgets/new_auth_SharedWidgets.dart';
import 'package:driverapp/widgets/shared_widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:driverapp/AppThemes/colors.dart';
import 'package:driverapp/AppThemes/fonts.dart';

//import 'package:file_picker/file_picker.dart';
//import 'dart:io';

class VehicleInformation extends StatefulWidget {
  const VehicleInformation({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _VehicleInformationState createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController vehiclenumbercontroller = TextEditingController();
  TextEditingController resgestrationdocumentcontroller =
      TextEditingController();
  TextEditingController insurancedocumentcontroller = TextEditingController();
  TextEditingController specialinsurancedocumentcontroller =
      TextEditingController();
  TextEditingController safetycertificatiocontroller = TextEditingController();
  File? selectedDocument;
  FilePickerResult? myresult;
  bool isLoading = false;
  String? documentUrl1;
  String? documentUrl2;
  String? documentUrl3;
  String? documentUrl4;
  FocusNode _focusnode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();
  FocusNode _focusnode5 = FocusNode();
  FocusNode _focusNode6 = FocusNode();
  bool vanselected = false;
  bool truckselected = false;
  bool containerselected = false;
  String? type;
  void selectVan() {
    setState(() {
      vanselected = true;
      truckselected = false;
      containerselected = false;
      type = 'Van';
    });
  }

  void selectTruck() {
    setState(() {
      vanselected = false;
      truckselected = true;
      containerselected = false;
      type = 'Truck';
    });
  }

  void selectContainer() {
    setState(() {
      vanselected = false;
      truckselected = false;
      containerselected = true;
      type = 'Container';
    });
  }

  @override
  void dispose() {
    vehiclenumbercontroller.dispose();
    resgestrationdocumentcontroller.dispose();
    weightcontroller.dispose();
    insurancedocumentcontroller.dispose();
    specialinsurancedocumentcontroller.dispose();
    safetycertificatiocontroller.dispose();
    _focusnode3.dispose();
    _focusNode4.dispose();
    _focusnode5.dispose();
    _focusNode6.dispose();
    super.dispose();
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
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Vehicle Informations',
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
                          title('Select Vehicle Type'),
                          SizedBox(
                            height: 15,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 15,
                                ),
                                truckType('assets/van.png', 'Van', selectVan,
                                    vanselected),
                                SizedBox(
                                  width: 15,
                                ),
                                truckType('assets/container.png', 'Container',
                                    selectContainer, containerselected),
                                SizedBox(
                                  width: 15,
                                ),
                                truckType('assets/truck.png', 'Truck',
                                    selectTruck, truckselected),
                                SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          title('Vehicle Capacity'),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField2(
                            hintText: 'Enter Weight',
                            width: 320,
                            controller: weightcontroller,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          title('Vehicle Number'),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField2(
                            hintText: 'Enter Veichle Number',
                            width: 320,
                            controller: vehiclenumbercontroller,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          title('Vehicle Regestration Document'),
                          SizedBox(
                            height: 15,
                          ),
                          documenttextfield(_focusnode3, () {
                            pickFile(
                                controller: resgestrationdocumentcontroller,
                                focusNode: _focusnode3);
                          }, resgestrationdocumentcontroller,
                              'Upload Document'),
                          SizedBox(
                            height: 15,
                          ),
                          title('Vehicle Insurance Document'),
                          SizedBox(
                            height: 15,
                          ),
                          documenttextfield(_focusNode4, () {
                            pickFile(
                                controller: insurancedocumentcontroller,
                                focusNode: _focusNode4);
                          }, insurancedocumentcontroller, 'Upload Document'),
                          SizedBox(
                            height: 15,
                          ),
                          title('Commercial Vehicle Insurance'),
                          SizedBox(
                            height: 15,
                          ),
                          documenttextfield(_focusnode5, () {
                            pickFile(
                                controller: specialinsurancedocumentcontroller,
                                focusNode: _focusnode5);
                          }, specialinsurancedocumentcontroller,
                              'Upload Document'),
                          SizedBox(
                            height: 15,
                          ),
                          title('Vehicle Safety Certification'),
                          SizedBox(
                            height: 15,
                          ),
                          documenttextfield(_focusNode6, () {
                            pickFile(
                                controller: safetycertificatiocontroller,
                                focusNode: _focusNode6);
                          }, safetycertificatiocontroller, 'Upload Document'),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            text: 'Submit',
                            onPressed: () async {
                              Future<void> uploade1 = UploadDocument(
                                  controller: resgestrationdocumentcontroller,
                                  focusNode: _focusnode3,
                                  documentUrl: documentUrl1);
                              Future<void> upload2 = UploadDocument(
                                  controller: insurancedocumentcontroller,
                                  focusNode: _focusNode4,
                                  documentUrl: documentUrl2);
                              Future<void> upload3 = UploadDocument(
                                  controller:
                                      specialinsurancedocumentcontroller,
                                  focusNode: _focusnode5,
                                  documentUrl: documentUrl3);
                              Future<void> upload4 = UploadDocument(
                                  controller: safetycertificatiocontroller,
                                  focusNode: _focusNode6,
                                  documentUrl: documentUrl4);
                              Future<void> uploadOperations;
                              uploadOperations = Future.wait<void>(
                                  [uploade1, upload2, upload3, upload4]);
                              await uploadOperations;
                              registerVehicle(
                                  '',
                                  weightcontroller.text,
                                  vehiclenumbercontroller.text,
                                  documentUrl1,
                                  documentUrl2,
                                  documentUrl3,
                                  documentUrl4);
                            },
                            gradientColors: [primaryGreen, secondaryGreen],
                            width: 320,
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )))));
  }

  Future<void> pickFile({
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

  Future<void> UploadDocument({
    required TextEditingController controller,
    required FocusNode focusNode,
    required String? documentUrl,
  }) async {
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

  void registerVehicle(
    String vehicletype,
    String capacity,
    String vehiclenumber,
    String? regestrationDocument,
    String? insuranceDocument,
    String? specialinsuranceDocument,
    String? safetyDocument,
  ) async {
    setState(() {
      isLoading = true;
    });

    try {
      final CollectionReference vehiclesCollection =
          FirebaseFirestore.instance.collection('Vehicles');
      Map<String, dynamic> vehicleData = {
        'vehicleType': vehicletype,
        'vehicleNumber': vehiclenumber,
        'registrationDocumentUrl': regestrationDocument,
        'insuranceDocumentUrl': insuranceDocument,
        'specialinsuranceDocumentUrl': specialinsuranceDocument,
        'safetyDocumentUrl': safetyDocument
      };
      await vehiclesCollection.add(vehicleData);

      print('Vehicle information registered successfully.');
    } catch (e) {
      print('Error registering vehicle information: $e');
    }

    setState(() {
      isLoading = false;
    });
  }
}
