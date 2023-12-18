import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:verifyme/Screens/login.dart";

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  var pagecontroller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber.shade400,
        body: Center(
          child: Column(children: [
            SizedBox(
              height: 200.h,
            ),
            SizedBox(
                //width: 270.w,
                //height: 100.h,
                //color: Colors.black,
                child: Image.asset(
              fit: BoxFit.cover,
              'lib/images/verify.png',
              height: 80.sp,
            )),
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              height: 70.sp,
              //color: Colors.blue,
              child: PageView(
                controller: pagecontroller,
                children: [
                  SizedBox(
                    child: Text(
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                        'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore'),
                  ),
                  SizedBox(
                    //color: Colors.grey,
                    //width: 350.w,
                    child: Text(
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                        'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore'),
                  ),
                  SizedBox(
                    //color: Colors.grey,
                    //width: 350.w,
                    child: Text(
                        style: TextStyle(fontSize: 16.sp),
                        textAlign: TextAlign.center,
                        'Lorem ipsum dolor sit amet, consectetur \n adipiscing elit, sed do eiusmod tempor \n incididunt ut labore'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            SmoothPageIndicator(
                effect: ExpandingDotsEffect(
                    spacing: 4.0,
                    activeDotColor: Colors.white,
                    dotColor: Colors.white38,
                    dotWidth: 10.w,
                    dotHeight: 4.h),
                controller: pagecontroller,
                count: 3),
            SizedBox(
              height: 60.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    // BoxShadow(
                    //   color: Colors.grey.shade900,
                    //   offset: Offset(1.0, 6.0), //(x,y)
                    //   blurRadius: 16.0,
                    // ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 6,
                      spreadRadius: 0,
                      offset: const Offset(
                        0,
                        15,
                      ),
                    ),
                  ],
                  //borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                width: 300.w,
                height: 50.h,
                child: Center(
                    child: Text(
                  "GET STARTED",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ]),
        ));
  }
}
