import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_document_scanner/flutter_document_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:verifyme/scanexample.dart';

class ScanResources extends StatefulWidget {
  File? scannedImage;
  ScanResources({required this.scannedImage, super.key});

  @override
  State<ScanResources> createState() => _ScanResourcesState();
}

class _ScanResourcesState extends State<ScanResources> {
  final controller = DocumentScannerController();
  //late CameraController controller;

  var datecontroller = TextEditingController();
  var monthcontroller = TextEditingController();
  var yearcontroller = TextEditingController();
  File? photoTaken;

  // final scannedDocument = FlutterDocumentScanner.scanDocument();

  // void click() {
  //   controller.takePhoto(
  //     minContourArea: 80000.0,
  //   );
  //   setState(() {});

  //   photoTaken = controller.pictureTaken;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
        ),
        body: DocumentScanner(
          generalStyles:
              GeneralStyles(hideDefaultDialogs: true, messageTakingPicture: ""),
          cropPhotoDocumentStyle: CropPhotoDocumentStyle(
              defaultAreaInitial: Area(
                  topLeft: Point(40, 80),
                  topRight: Point(300, 80),
                  bottomLeft: Point(40, 450),
                  bottomRight: Point(300, 450))),
          takePhotoDocumentStyle: TakePhotoDocumentStyle(
              hideDefaultButtonTakePicture: true,
              children: [
                Positioned(
                    bottom: 20,
                    right: 80,
                    left: 80,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.takePhoto(
                          minContourArea: 80000.0,
                        );

                        final File? photoTaken = controller.pictureTaken;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ScanExample(
                                      photo: photoTaken,
                                    )));

                        print("hhhhshshshshshshsghdgfgfgfg");
                      },
                      child: Text('Click'),
                    ))
              ]),
          resolutionCamera: ResolutionPreset.high,
          controller: controller,
          onSave: (Uint8List imageBytes) {
            print("image bytes: $imageBytes");
            print("hhhhshshshshshshsghdgfgfgfg");

            controller.takePhoto(
              minContourArea: 80000.0,
            );
          },
        ));
  }
}
