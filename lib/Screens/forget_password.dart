import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:verifyme/Screens/mobile_verification.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  EmailOTP myauth = EmailOTP();

  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(height: 70.h),
        Container(
          width: 200.w,
          margin: EdgeInsets.only(right: 20.w),
          //width: MediaQuery.of(context).size.width,
          //height: 100.h,
          //color: Colors.black,
          child: Image.asset(
            'assets/images/Verifyme_yellow.png',
            color: Colors.yellow,
            fit: BoxFit.cover,
            //height: 70.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Forget password',
          style: TextStyle(
              letterSpacing: 2.0, fontSize: 25.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20.h),
        Text(
          'Welcome Back! Enter Your Ragister \n Email & Password',
          style: TextStyle(fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 30.h),
        SizedBox(
          width: 320.w,
          child: TextField(
            controller: emailController,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                filled: true,
                fillColor: Colors.grey.shade200,
                contentPadding: EdgeInsets.all(20.sp),
                isDense: true,
                hintText: "zapperr@gmail.com",
                suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 6.w),
                    child: Image.asset(
                      'assets/images/openmail.png',
                      scale: 1,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(10.r))),
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          width: 335.w,
          child: Row(
            children: [
              Checkbox(
                checkColor: Colors.black,
                fillColor: MaterialStateProperty.all(Colors.grey.shade300),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                  4.r,
                )),
                value: true,
                onChanged: (value) {},
              ),
              Text("Keep me logged in",
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: () async {
            myauth.setConfig(
                appEmail: "me@rohitchouhan.com",
                appName: "Email OTP",
                userEmail: emailController.text,
                otpLength: 6,
                otpType: OTPType.digitsOnly);

            try {
              if (await myauth.sendOTP() == true) {
                print("otp send");

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MobileVerification(),
                  ),
                );
              } else {
                print("otp not send ");
              }
            } catch (e) {
              Fluttertoast.showToast(msg: e.toString());
              print(e);
            }
          },
          /*sendOtp();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MobileVerification(),
              ),
            );*/

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
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            )),
          ),
        ),
        SizedBox(height: 20.h),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            // ignore: unnecessary_string_escapes
            "Don\'t have an acount? ",
            style: TextStyle(fontSize: 18.sp, letterSpacing: 1.sp),
          ),
          Text("Register",
              style: TextStyle(
                  letterSpacing: 1.sp, fontSize: 18.sp, color: Colors.amber))
        ])
      ]),
    );
  }
}
