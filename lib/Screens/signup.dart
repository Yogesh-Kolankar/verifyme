import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:verifyme/Screens/login.dart';
import 'package:verifyme/model/usermodel.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final auth = FirebaseAuth.instance;

  signUp(email, password, firstName, lastName, confirmPassword,
      BuildContext context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString())
          .then(
            (value) => {
              postDetailsToFirestore(
                  email, firstName, lastName, password, confirmPassword),
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Login())),
            },
          );
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  // signUp(email, password, firstName, lastName, confirmPassword) async {
  //   try {
  //     await auth
  //         .createUserWithEmailAndPassword(email: email, password: password)
  //         .then(
  //           (value) => {
  //             postDetailsToFirestore(
  //                 email, firstName, lastName, password, confirmPassword),
  //           },
  //         );
  //     Navigator.of(context as BuildContext)
  //         .pushReplacement(MaterialPageRoute(builder: (context) => Login()));

  //     // Navigator.of(context as BuildContext)
  //     //     .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  //   } catch (e) {
  //     Fluttertoast.showToast(msg: e.toString());
  //   }
  // }

  postDetailsToFirestore(
      email, firstName, lastName, password, confirmPassword) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();
    userModel.uid = user!.uid;
    userModel.email = user.email;
    userModel.firstName = firstName.text;
    userModel.lastName = lastName.text;
    userModel.password = password.text;
    userModel.confirmPassword = confirmPassword.text;
    await firebaseFirestore
        .collection("allUsers")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Account created successfuly");
    print("aaa::${userModel.toMap()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 60.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text("Create Account",
                  style:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text("Complete from below to continue",
                  style: TextStyle(fontSize: 12.sp)),
            ),
            SizedBox(height: 30.h),
            Center(
              child: SizedBox(
                width: 300.w,
                child: TextField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23.sp),
                      isDense: true,
                      labelText: "First Name",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          'lib/images/textfielduser.png',
                          scale: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r))),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: 300.w,
                child: TextField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23.sp),
                      isDense: true,
                      labelText: "Last Name",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          'lib/images/textfielduser.png',
                          scale: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                          gapPadding: 20.w,
                          borderRadius: BorderRadius.circular(14.r))),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: Container(
                width: 300.w,
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23.sp),
                      isDense: true,

                      //label: Text("Username"),
                      labelText: "Email",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          'lib/images/@.png',
                          scale: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r))),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: 300.w,
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23.sp),
                      isDense: true,
                      labelText: "Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          'lib/images/textfieldpassword.png',
                          scale: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r))),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: SizedBox(
                width: 300.w,
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(23.sp),
                      isDense: true,
                      labelText: "Re-type Password",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 6),
                        child: Image.asset(
                          'lib/images/textfieldpassword.png',
                          scale: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r))),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(
                          6.r,
                        )),
                    value: false,
                    onChanged: (value) {},
                  ),
                  Text("Accept term & conditions",
                      style: TextStyle(fontSize: 12.sp)),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  signUp(
                    emailController.text,
                    passwordController.text,
                    firstNameController.text,
                    lastNameController.text,
                    confirmPasswordController.text,
                    context,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
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
                        offset: Offset(
                          0,
                          15,
                        ),
                      ),
                    ],
                    //borderRadius: BorderRadius.circular(20),
                    color: Colors.amber,
                  ),
                  width: 300.w,
                  height: 50.h,
                  child: Center(
                      child: Text(
                    "REGISTER",
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(fontSize: 12.sp)),
                Text('  Sign in here',
                    style: TextStyle(fontSize: 12.sp, color: Colors.amber))
              ],
            )
          ]),
        ),
      ),
    );
  }
}
