import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({super.key});

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
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
            'Verify Phone',
            style: TextStyle(
                letterSpacing: 2.0,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Text(
            'Code is sent to +91 9893034965',
            style: TextStyle(fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40.h),
          OTPTextField(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 12.sp, vertical: 14.sp),
            isDense: true,
            textFieldAlignment: MainAxisAlignment.spaceBetween,
            outlineBorderRadius: 10.r,
            fieldStyle: FieldStyle.box,
            length: 4,
            width: 240.w,
            otpFieldStyle: OtpFieldStyle(
              backgroundColor: Colors.grey.shade200,
              focusBorderColor: Colors.transparent,
              enabledBorderColor: Colors.transparent,
            ),
            fieldWidth: 50.sp,
            style: TextStyle(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    // ignore: unnecessary_string_escapes
                    "Don\'t have Recieved the Code? ",
                    style: TextStyle(
                        //letterSpacing: 0.5,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                  Text("Request",
                      style: TextStyle(
                          color: Colors.amber,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp))
                ],
              ),
              Text("again Get via call",
                  style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp))
            ],
          )
        ])));
  }
}
