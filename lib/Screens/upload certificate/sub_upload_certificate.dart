import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:file_picker/file_picker.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:open_file/open_file.dart';
import "package:percent_indicator/circular_percent_indicator.dart";
import "package:percent_indicator/linear_percent_indicator.dart";

class Display extends StatefulWidget {
  List<PlatformFile> file;
  List<File> filesUploaded = [];
  Display({super.key, required this.file});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  Widget buildItemCount() {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.red,
        child: Text(
          widget.file.length.toString(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            buildItemCount(),
          ],
          title: Text(
            "Selected Files",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: widget.file.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // OpenFile.open(widget.file[index].path);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: Colors.amber,
                            title: Text(
                              'Do you want to open it',
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    OpenFile.open(widget.file[index].path);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Yes",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20))),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("No",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20)))
                            ],
                          );
                        });

                    print("taped ${widget.file[index].path}");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10.r), // Adjust the radius as needed
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                widget.file.removeAt(index);
                              });
                            },
                            icon: Icon(Icons.delete)),
                        subtitle: Text("${widget.file[index].size / 100}"),
                        tileColor: Colors.grey.shade300,
                        title: Text(
                          widget.file[index].name.toString(),
                          overflow: TextOverflow.ellipsis,
                        ),
                        leading: Container(
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10.r)),
                          height: 60,
                          width: 60,
                          child: Center(
                            child: Text(
                              ".${widget.file[index].extension}",
                              style: TextStyle(
                                  fontSize: 20.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
                  ),
                );
              }),
          Positioned(
              right: 20,
              left: 20,
              bottom: 80,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  onPressed: () async {
                    List<File> files = [File(widget.file.toString())];
                    try {
                      for (File file in files) {
                        if (file.existsSync()) {
                          String storagePath = "files/${file.path}";
                          Reference ref =
                              FirebaseStorage.instance.ref().child(storagePath);

                          // Upload the file
                          await ref.putFile(file);
                          print("uploaded");
                        }
                        // Create a reference to the file in Firebase Storage
                      }
                    } catch (e) {
                      print("Error uploading files: $e");
                    }
                  },
                  child: Text(
                    "UPLOAD",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  ))),
          Positioned(
            right: 20,
            left: 20,
            bottom: 10,
            child: CircularPercentIndicator(
              center: Text("100%"),
              animationDuration: 1000,
              radius: 30,
              lineWidth: 13.0,
              animation: true,
              progressColor: Colors.amber,
              percent: 0.3,
            ),
          ),
        ]));
  }
}
