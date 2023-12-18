import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/mobile_verification.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 70.h),
              SizedBox(
                width: 200.w,
                //margin: EdgeInsets.only(left: 100.w),
                //width: MediaQuery.of(context).size.width,
                //height: 100.h,
                //color: Colors.black,
                child: Image.asset(
                  'lib/images/Verifyme_yellow.png',
                  color: Colors.yellow,
                  fit: BoxFit.cover,
                  //height: 70.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Change password',
                style: TextStyle(
                    letterSpacing: 2.0,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.h),
              Text(
                'Welcome Back! Enter Your New \n Password here',
                style: TextStyle(fontSize: 16.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 70.h),
              SizedBox(
                width: 320.w,
                child: TextField(
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.r)),
                      contentPadding: EdgeInsets.all(20.sp),
                      isDense: true,
                      hintText: "Change Password.......",
                      suffixIcon: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.visibility,
                          size: 25.sp,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(10.r))),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 320.w,
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(10.r)),

                    filled: true, fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.all(20.sp),
                    isDense: true,

                    //label: Text("Username"),
                    hintText: "Change Password.......",
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: Icon(
                        Icons.visibility,
                        size: 25.sp,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MobileVerification(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),

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
                    "SUBMIT",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(height: 40.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Bact to ",
                  style: TextStyle(fontSize: 18.sp, letterSpacing: 1.sp),
                ),
                Text("Home?",
                    style: TextStyle(
                        letterSpacing: 1.sp,
                        fontSize: 18.sp,
                        color: Colors.amber))
              ])
            ]),
      ),
    );
  }
}
