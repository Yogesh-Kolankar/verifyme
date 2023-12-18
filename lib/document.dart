import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  String? valueChange = 'Today';
  List listItem = ['Today', 'Toworrow', 'Last Week'];
  List<bool> isSelectedList = List.generate(5, (index) => false);
  Color tileColor = Colors.transparent;
  bool onnselected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: 20.sp,
                  ),
                  Icon(
                    Icons.settings,
                    size: 25.sp,
                    color: Colors.blueGrey.shade700,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Document",
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey.shade700),
                )
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 320.w,
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.amber.shade100,
                    contentPadding: EdgeInsets.all(6.sp),
                    isDense: true,
                    labelText: "Search files....",
                    labelStyle: TextStyle(fontSize: 16.sp, color: Colors.amber),
                    prefixIcon: Padding(
                        padding: EdgeInsets.only(right: 6, left: 6),
                        child: Icon(
                          Icons.search,
                          color: Colors.amber,
                        )),
                    border: InputBorder.none),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: 20.w,
                ),
                DropdownButton(
                    dropdownColor: Colors.amber.shade100,
                    underline: Container(
                      color: Colors.transparent,
                    ),
                    hint: Text(
                      'Sort by date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    icon: Icon(Icons.arrow_drop_down),
                    items: [
                      DropdownMenuItem(
                        child: Text("Today"),
                        value: "Toady",
                      ),
                      DropdownMenuItem(
                        child: Text("Tomorrow"),
                        value: "Tomorrow",
                      ),
                      DropdownMenuItem(
                        child: Text("Last Week"),
                        value: "Last Week",
                      ),
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        valueChange = newValue;
                      });
                    }),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Today",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blueGrey.shade800,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 200,
                    //color: Colors.amber,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle the selected state for the tapped item
                              isSelectedList[index] = !isSelectedList[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isSelectedList[index]
                                    ? Colors.amber
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            margin:
                                EdgeInsets.only(left: 8, right: 8, bottom: 4),
                            child: ListTile(
                              subtitle: Text(
                                "Pages",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              minVerticalPadding: 10,
                              leading: Image.asset(
                                "lib/images/pdf.png",
                                height: 40.sp,
                              ),
                              trailing: Icon(
                                Icons.star,
                                size: 20.sp,
                              ),
                              title: Text(
                                "Documents",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Last Week",
                          style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.blueGrey.shade800,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: 100,
                    //color: Colors.amber,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle the selected state for the tapped item
                              isSelectedList[index] = !isSelectedList[index];
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isSelectedList[index]
                                    ? Colors.amber
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(20)),
                            margin:
                                EdgeInsets.only(left: 8, right: 8, bottom: 4),
                            child: ListTile(
                              subtitle: Text(
                                "Pages",
                                style: TextStyle(
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              minVerticalPadding: 10,
                              leading: Image.asset(
                                "lib/images/pdf.png",
                                height: 40.sp,
                              ),
                              trailing: Icon(
                                Icons.star,
                                size: 20.sp,
                              ),
                              title: Text(
                                "Documents",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
