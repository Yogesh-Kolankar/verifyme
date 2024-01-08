import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/upload_two.dart';
import 'package:verifyme/Screens/upload%20certificate/sub_upload_certificate.dart';

class UploadCertificate extends StatefulWidget {
  const UploadCertificate({super.key});

  @override
  State<UploadCertificate> createState() => _UploadCertificateState();
}

class _UploadCertificateState extends State<UploadCertificate> {
  Color containerColor = Colors.grey.shade300;
  bool isContainerEnabled = false;
  Color containerColor1 = Colors.grey.shade300;
  bool isContainerEnabled1 = false;
  Color containerColor2 = Colors.grey.shade300;
  bool isContainerEnabled2 = false;
  Color containerColor3 = Colors.grey.shade300;
  bool isContainerEnabled3 = false;
  Color containerColor4 = Colors.grey.shade300;
  bool isContainerEnabled4 = false;
  Color containerColor5 = Colors.grey.shade300;
  bool isContainerEnabled5 = false;

  openFile(List<PlatformFile> files) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Display(
                  file: files,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(children: [
        Container(
            //color: Colors.blue,
            ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r)),
            color: Colors.yellow.shade200,
          ),
          height: 120.sp,
        ),
        Positioned(
          left: 30.sp,
          top: 60.sp,
          child: Text("Upload Certificate",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
        ),
      ]),
      Padding(
        padding: EdgeInsets.only(right: 30.w, left: 30.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Select certificate type:",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['pdf'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    //pickFile();

                    setState(() {
                      isContainerEnabled = !isContainerEnabled;
                      containerColor = containerColor == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled ? Border.all() : null,
                        color: containerColor,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.Pdf",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['jpg'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    setState(() {
                      isContainerEnabled1 = !isContainerEnabled1;
                      containerColor1 = containerColor1 == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled1 ? Border.all() : null,
                        color: containerColor1,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.jpg",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['png'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    setState(() {
                      isContainerEnabled2 = !isContainerEnabled2;
                      containerColor2 = containerColor2 == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled2 ? Border.all() : null,
                        color: containerColor2,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.png",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['mp4'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    setState(() {
                      isContainerEnabled3 = !isContainerEnabled3;
                      containerColor3 = containerColor3 == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled3 ? Border.all() : null,
                        color: containerColor3,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.mp4",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['doc'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    setState(() {
                      isContainerEnabled4 = !isContainerEnabled4;
                      containerColor4 = containerColor4 == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled4 ? Border.all() : null,
                        color: containerColor4,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.doc",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result = await FilePicker.platform
                        .pickFiles(
                            allowMultiple: true,
                            allowedExtensions: ['mp3'],
                            type: FileType.custom);

                    if (result != null) {
                      openFile(result.files);
                    } else {
                      // User recanceled the picker
                      return;
                    }
                    setState(() {
                      isContainerEnabled5 = !isContainerEnabled5;
                      containerColor5 = containerColor5 == Colors.grey.shade300
                          ? Colors.amber
                          : Colors.grey.shade300;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: isContainerEnabled5 ? Border.all() : null,
                        color: containerColor5,
                        borderRadius: BorderRadius.circular(15.r)),
                    height: 90.sp,
                    width: 140.sp,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/folder.png',
                            height: 40.sp,
                          ),
                          Text(
                            "Other.mp3",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.bold),
                          )
                        ]),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ]));
  }
}
