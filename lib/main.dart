import "package:firebase_auth/firebase_auth.dart";
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:verifyme/Screens/bottambar.dart";
import "package:verifyme/Screens/profile_page.dart";
import "package:verifyme/Screens/upload%20certificate/sub_upload_certificate.dart";
import "package:verifyme/Screens/upload%20certificate/upload_certificate.dart";
import "package:verifyme/Screens/welcome.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyB83DSo3ZOIE34SPTlsra638xO5OS5fFkI",
      appId: "1:665033827060:android:61ef124f060964933674a1",
      messagingSenderId: "",
      projectId: "verifyme-828b4",
      storageBucket: "verifyme-828b4.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
          title: "Verify Me",
          theme: ThemeData(primarySwatch: Colors.grey),
          debugShowCheckedModeBanner: false,
          //home: UploadCertificate()
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ScreenChnages();
              } else {
                return WelcomeScreen();
              }
            },
          ) //ScreenChnages() //WelcomeScreen(),
          ),
    );
  }
}
