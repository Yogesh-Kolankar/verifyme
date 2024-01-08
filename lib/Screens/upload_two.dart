import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/upload_one.dart';

class UploadTwo extends StatefulWidget {
  const UploadTwo({super.key});

  @override
  State<UploadTwo> createState() => _UploadTwoState();
}

class _UploadTwoState extends State<UploadTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Stack(
        children: [
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
            height: 150.sp,
          ),
          Positioned(
            left: 30.sp,
            top: 60.sp,
            child: Text("Upload",
                style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
          ),
          Positioned(
            left: 210.sp,
            top: 4.sp,
            child: SizedBox(
              //color: Colors.black,
              child: Image.asset(
                fit: BoxFit.cover,
                "assets/images/coffeebreak.png",
                height: 150.sp,
              ),
            ),
          ),
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 15.h),
          SizedBox(
            height: 100.sp,
            //color: Colors.black,
            child: Image.asset("assets/images/ProfilePicture.png"),
          ),
        ],
      ),
      Text("Denial Jhon",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
      Text(
        "Member since August 1,2022",
        style: TextStyle(fontSize: 12.sp),
      ),
      SizedBox(
        height: 50.h,
      ),
      Text("100% Uploaded",
          style: TextStyle(
              letterSpacing: -1.0,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold)),
      SizedBox(
        height: 120.h,
        //color: Colors.black,
        child: Image.asset(
          "assets/images/man.png",
          fit: BoxFit.cover,
        ),
      ),
      SizedBox(height: 40.h),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UploadOne(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),

            // BoxShadow(
            //   color: Colors.grey.shade900,
            //   offset: Offset(1.0, 6.0), //(x,y)
            //   blurRadius: 16.0,
            // ),

            //borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          width: 140.w,
          height: 35.h,
          child: Center(
              child: Text(
            "Done",
            style: TextStyle(
              fontSize: 20.sp,
            ),
          )),
        ),
      ),
    ]));
  }
}
