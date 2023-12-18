import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:verifyme/Screens/upload_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      body: Stack(
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
            height: 180.sp,
          ),
          Positioned(
            left: 30.sp,
            top: 100.sp,
            child: Text("Profile",
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
            top: 190.sp,
            child: Center(
              child: SizedBox(
                height: 100.sp,
                //color: Colors.black,
                child: Image.asset("lib/images/ProfilePicture.png"),
              ),
            ),
          ),
          Positioned(
            top: 290.sp,
            left: 30.w,
            child: SizedBox(
              width: 300.w,
              //color: Colors.purple,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text("Denial Jhon",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text(
                      "Member since August 1,2022",
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Space Used",
                    style: TextStyle(fontSize: 14.sp),
                  ),
                  Text(
                    "40% of 500 GB",
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Text(
                    "Recent Files",
                    style: TextStyle(
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                    color: Colors.transparent,
                    height: 60.sp,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20.r)),
                          height: 70.h,
                          width: 230.w,
                          margin: EdgeInsets.only(right: 20.sp),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5.w,
                              ),
                              Image.asset(
                                "lib/images/pdffile.png",
                                height: 50.sp,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Myself.pdf",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    "2.00 Mb",
                                    style: TextStyle(fontSize: 8.sp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 400.sp,
            left: 20.sp,
            child: Row(
              children: [
                LinearPercentIndicator(
                  animation: true,
                  width: 320.w,
                  progressColor: Colors.amber,
                  barRadius: Radius.circular(10.r),
                  lineHeight: 8,
                  percent: 0.5,
                ),
              ],
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UploadPage(),
                  ),
                );
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
                  "Upload Document",
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
