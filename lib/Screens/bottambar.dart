import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:persistent_bottom_nav_bar/persistent_tab_view.dart";
import "package:verifyme/Screens/profile_page.dart";
import "package:verifyme/Screens/upload_two.dart";
import "package:verifyme/document.dart";

class ScreenChnages extends StatefulWidget {
  const ScreenChnages({super.key});

  @override
  State<ScreenChnages> createState() => _ScreenChnagesState();
}

class _ScreenChnagesState extends State<ScreenChnages> {
  final navcontroller = PersistentTabController(initialIndex: 0);
  int selectedIndex = 0;

  List<Widget> screens() {
    return [ProfilePage(), DocumentScreen(), UploadTwo()];
  }

  List<PersistentBottomNavBarItem> navBarItems() {
    return [
      PersistentBottomNavBarItem(
          icon: Icon(
        Icons.home,
        color: Colors.amber,
      )),
      PersistentBottomNavBarItem(
          icon: Icon(Icons.file_copy, color: Colors.amber)),
      PersistentBottomNavBarItem(icon: Icon(Icons.person, color: Colors.amber))
    ];
  }

  void navigateBottamBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [ProfilePage(), DocumentScreen(), UploadTwo()];
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      screens: screens(),
      items: navBarItems(),
      controller: navcontroller,
      navBarStyle: NavBarStyle.simple,
    );
  }
}
