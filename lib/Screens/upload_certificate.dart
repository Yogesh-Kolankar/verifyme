import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:verifyme/Screens/upload_two.dart';

class UploadCertificate extends StatefulWidget {
  const UploadCertificate({super.key});

  @override
  State<UploadCertificate> createState() => _UploadCertificateState();
}

class _UploadCertificateState extends State<UploadCertificate> {
  Color containerColor = Colors.grey.shade300;
  bool isContainerEnabled = false;
  Color containerColor1 = Colors.grey.shade300;
  bool isContainerEnabled1 = false;
  Color containerColor2 = Colors.grey.shade300;
  bool isContainerEnabled2 = false;
  Color containerColor3 = Colors.grey.shade300;
  bool isContainerEnabled3 = false;
  Color containerColor4 = Colors.grey.shade300;
  bool isContainerEnabled4 = false;
  Color containerColor5 = Colors.grey.shade300;
  bool isContainerEnabled5 = false;
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
        body: Column(children: [
          Stack(children: [
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
              height: 120.sp,
            ),
            Positioned(
              left: 30.sp,
              top: 60.sp,
              child: Text("Upload Certificate",
                  style:
                      TextStyle(fontSize: 30.sp, fontWeight: FontWeight.bold)),
            ),
          ]),
          Padding(
            padding: EdgeInsets.only(right: 30.w, left: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Text(
                  "Select certificate type:",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled = !isContainerEnabled;
                          containerColor =
                              containerColor == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled ? Border.all() : null,
                            color: containerColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled1 = !isContainerEnabled1;
                          containerColor1 =
                              containerColor1 == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled1 ? Border.all() : null,
                            color: containerColor1,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled2 = !isContainerEnabled2;
                          containerColor2 =
                              containerColor2 == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled2 ? Border.all() : null,
                            color: containerColor2,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled3 = !isContainerEnabled3;
                          containerColor3 =
                              containerColor3 == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled3 ? Border.all() : null,
                            color: containerColor3,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled4 = !isContainerEnabled4;
                          containerColor4 =
                              containerColor4 == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled4 ? Border.all() : null,
                            color: containerColor4,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isContainerEnabled5 = !isContainerEnabled5;
                          containerColor5 =
                              containerColor5 == Colors.grey.shade300
                                  ? Colors.amber
                                  : Colors.grey.shade300;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: isContainerEnabled5 ? Border.all() : null,
                            color: containerColor5,
                            borderRadius: BorderRadius.circular(15.r)),
                        height: 90.sp,
                        width: 140.sp,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'lib/images/folder.png',
                                height: 40.sp,
                              ),
                              Text(
                                "Other.Pdf",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => UploadTwo()));
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
                "Upload Certificate",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ]));
  }
}
