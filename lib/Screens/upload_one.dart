import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class UploadOne extends StatefulWidget {
  const UploadOne({super.key});

  @override
  State<UploadOne> createState() => _UploadOneState();
}

class _UploadOneState extends State<UploadOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/images/bottamgarage.png",
                  height: 30.h,
                  scale: 1,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/images/bottamsim.png",
                  height: 30.h,
                  scale: 1,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Image.asset(
                  "lib/images/bottamperson.png",
                  height: 20.h,
                  scale: 1,
                ),
                label: "")
          ]),
      body: Stack(children: [
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
          height: 190.sp,
        ),
        Positioned(
          left: 30.sp,
          top: 100.sp,
          child: Text("Upload",
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
        ),
        Positioned(
          left: 210.sp,
          top: 40.sp,
          child: SizedBox(
            //color: Colors.black,
            child: Image.asset(
              fit: BoxFit.cover,
              "lib/images/coffeebreak.png",
              height: 150.sp,
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 250.sp,
          child: SizedBox(
            height: 100.sp,
            //color: Colors.black,
            child: Image.asset("lib/images/ProfilePicture.png"),
          ),
        ),
        Positioned(
          top: 350.sp,
          left: 0,
          right: 0,
          child: Column(children: [
            Center(
              child: Text("Denial Jhon",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text(
                "Member since August 1,2022",
                style: TextStyle(fontSize: 12.sp),
              ),
            ),
          ]),
        ),
        Positioned(
          top: 470.sp,
          left: 30.w,
          child: Text(
            "69% Uploaded...",
            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
          ),
        ),
        Positioned(
          top: 500.sp,
          left: 20.sp,
          child: Row(
            children: [
              LinearPercentIndicator(
                animation: true,
                width: 320.w,
                progressColor: Colors.amber,
                barRadius: Radius.circular(10.r),
                lineHeight: 10,
                percent: 0.8,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
