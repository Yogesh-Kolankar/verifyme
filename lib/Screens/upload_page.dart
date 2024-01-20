import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/scan_resources.dart';
import 'package:verifyme/Screens/upload%20certificate/upload_certificate.dart';
import 'package:verifyme/Screens/upload_resources.dart';
import 'dart:io';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  File? scannedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "assets/images/coffeebreak.png",
              height: 150.sp,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 210.sp,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadCertificate(),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'assets/images/cloudcomputing.png',
                            height: 50.sp,
                          ),
                          Text(
                            "Select Certificate",
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UploadResources(),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'assets/images/cloudcomputing.png',
                            height: 50.sp,
                          ),
                          Text(
                            "Upload Resources",
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScanResources(scannedImage: scannedImage),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'assets/images/scan.png',
                            height: 50.sp,
                          ),
                          Text(
                            // ignore: unnecessary_string_escapes
                            "Scan License\'s + CV",
                            style: TextStyle(fontSize: 20.sp),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
