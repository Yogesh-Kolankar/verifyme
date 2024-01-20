import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';
import 'package:verifyme/document.dart';

class UploadResources extends StatefulWidget {
  const UploadResources({super.key});

  @override
  State<UploadResources> createState() => _UploadResourcesState();
}

class _UploadResourcesState extends State<UploadResources> {
  var datecontroller = TextEditingController();
  var monthcontroller = TextEditingController();
  var yearcontroller = TextEditingController();

  bool selected = true;
  bool dataShow = false;
  File? file;
  PlatformFile? myfile;
  UploadTask? uploadTask;

  Widget buildProgress() {
    return StreamBuilder<TaskSnapshot>(
        stream: uploadTask?.snapshotEvents,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;
            double progress = data.bytesTransferred / data.totalBytes;

            return LinearPercentIndicator(
                curve: Curves.linear,
                animationDuration: 500,
                animateFromLastPercent: true,
                center: Text(
                  "${(100 * progress).toStringAsFixed(2)}%",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                //backgroundColor: Colors.grey.shade500,
                fillColor: Colors.transparent,
                animation: true,
                progressColor: Colors.amber,
                barRadius: Radius.circular(10.r),
                lineHeight: 16.h,
                percent: progress);

            //return Text("${100 * progress}");
          } else {
            return Text("");
          }
        });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      dataShow = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(children: [
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
          child: Text("Upload Resources",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
        ),
      ]),
      const SizedBox(
        height: 30,
      ),
      GestureDetector(
        onTap: selected
            ? () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles(allowMultiple: false);

                if (result != null) {
                  //file = File(result.toString());
                  myfile = result.files.single;

                  setState(() {
                    selected = false;
                  });
                } else {
                  // User recanceled the picker
                  return;
                }
              }
            : () {},
        child: DottedBorder(
            color: Colors.grey,
            dashPattern: [4, 4],
            strokeWidth: 1.w,
            borderType: BorderType.RRect,
            radius: Radius.circular(6.r),
            borderPadding: EdgeInsets.all(4),
            child: Container(
              height: 130.sp,
              width: 320.sp,
              child: selected
                  ? Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        SizedBox(
                          //color: Colors.amber,
                          child: Image.asset(
                            'assets/images/cloudcomputing.png',
                            height: 60.sp,
                          ),
                        ),
                        Text(
                          "Upload Resources",
                          style: TextStyle(
                              fontSize: 20.sp, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  selected = true;
                                });
                              },
                              child: Text("Remove",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold))),
                          Text(
                            myfile!.name,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          buildProgress()
                        ],
                      )),

              //color: Colors.black,
            )),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Enter Expiry Date: ",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: 60.w,
            child: TextfieldDatePicker(
              textAlign: TextAlign.center,
              textfieldDatePickerController: datecontroller,
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat("dd"),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  //contentPadding:

                  hintText: "DD",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey.shade100))),
            ),
          ),
          SizedBox(
            width: 60.w,
            child: TextfieldDatePicker(
              textAlign: TextAlign.center,
              textfieldDatePickerController: monthcontroller,
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat("MMM"),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  //contentPadding:

                  hintText: "MM",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey.shade100))),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: TextfieldDatePicker(
              textAlign: TextAlign.center,
              textfieldDatePickerController: yearcontroller,
              cupertinoDatePickerBackgroundColor: Colors.white,
              cupertinoDatePickerMaximumDate: DateTime(2099),
              cupertinoDatePickerMaximumYear: 2099,
              cupertinoDatePickerMinimumYear: 1990,
              cupertinoDatePickerMinimumDate: DateTime(1990),
              cupertinoDateInitialDateTime: DateTime.now(),
              materialDatePickerFirstDate: DateTime.now(),
              materialDatePickerInitialDate: DateTime.now(),
              materialDatePickerLastDate: DateTime(2099),
              preferredDateFormat: DateFormat("yyyy"),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  //contentPadding:

                  hintText: "YYYY",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 10.sp),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey)),
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.r),
                      borderSide: BorderSide(color: Colors.grey.shade100))),
            ),
          )
        ],
      ),
      SizedBox(
        height: 10.h,
      ),
      GestureDetector(
        onTap: () async {
          final path = 'files/${myfile!.name}';
          final file = File(myfile!.path!);

          final ref = FirebaseStorage.instance.ref().child(path);

          setState(() {
            uploadTask = ref.putFile(file);
          });

          final snapshot = await uploadTask!.whenComplete(() {});

          Fluttertoast.showToast(msg: "Successfully Uploaded");

          final url = await snapshot.ref.getDownloadURL();

          print("Download Link $url");

          setState(() {
            uploadTask = null;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),

            // BoxShadow(
            //   color: Colors.grey.shade900,
            //   offset: Offset(1.0, 6.0), //(x,y)
            //   blurRadius: 16.0,
            // ),

            //borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          width: 320.w,
          height: 50.h,
          child: Center(
              child: Text(
            "Upload Resources",
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
          )),
        ),
      ),
      SizedBox(
        height: 10.h,
      ),
      Text(
        "Or",
        style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        height: 10.h,
      ),
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DocumentScreen(),
          ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.amber,
          ),
          width: 320.sp,
          height: 100.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //color: Colors.amber,
                child: Image.asset(
                  'assets/images/scan1.png',
                  height: 60.sp,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Scan Resources",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ]));
  }
}
