import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:textfield_datepicker/textfield_datepicker.dart';
import 'package:intl/intl.dart';

class ScanResources extends StatefulWidget {
  const ScanResources({super.key});

  @override
  State<ScanResources> createState() => _ScanResourcesState();
}

class _ScanResourcesState extends State<ScanResources> {
  //late CameraController controller;

  var datecontroller = TextEditingController();
  var monthcontroller = TextEditingController();
  var yearcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/bottamgarage.png",
                  height: 30.h,
                  scale: 1,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/bottamsim.png",
                  height: 30.h,
                  scale: 1,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/images/bottamperson.png",
                  height: 20.h,
                  scale: 1,
                ),
                label: "")
          ]),
      body: Stack(children: [
        Container(
          color: Colors.amber,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(
            Icons.arrow_back,
            size: 30,
          ),
          Text(
            "Scan Resources",
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
          ),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.amber.shade300,
            child: Icon(
              Icons.info_outline,
              //size: 10.sp,
            ),
          )
        ]),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            height: MediaQuery.of(context).size.height / 4.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Scan Resources",
                    style:
                        TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Enter Expiry Date: ",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.h, vertical: 14.h),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              //contentPadding:

                              hintText: "DD",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100))),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 14.h),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              //contentPadding:

                              hintText: "MM",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100))),
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 14.h),
                              isDense: true,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              //contentPadding:

                              hintText: "YYYY",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.sp),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide: BorderSide(color: Colors.grey)),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.r),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100))),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
        Positioned(
          top: 100,
          left: 40,
          right: 40,
          child: Container(
            child: Image.asset(
              "assets/images/scanbig.png",
              height: 10.sp,
            ),
            height: 250.h,
            width: 250.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 4)),
          ),
        )
      ]),
    );
  }
}
