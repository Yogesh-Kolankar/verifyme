import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/scan_resources.dart';
import 'package:verifyme/Screens/upload_certificate.dart';
import 'package:verifyme/Screens/upload_resources.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
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
                      'lib/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'lib/images/cloudcomputing.png',
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
                      'lib/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'lib/images/cloudcomputing.png',
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
                        builder: (context) => const ScanResources(),
                      ));
                },
                child: Stack(
                  children: [
                    Image.asset(
                      'lib/images/Group.png',
                      height: 110.sp,
                    ),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Image.asset(
                            'lib/images/scan.png',
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
