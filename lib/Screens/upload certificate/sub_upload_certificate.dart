import "dart:io";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

class Display extends StatefulWidget {
  List<PlatformFile> file;
  Display({super.key, required this.file});

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Selected Files"),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: widget.file.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListTile(
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
                            borderRadius: BorderRadius.circular(10)),
                        height: 60,
                        width: 60,
                        child: Center(
                          child: Text(
                            ".${widget.file[index].extension}",
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      )),
                );
              }),
          Positioned(
              right: 20,
              left: 20,
              bottom: 20,
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.amber),
                  ),
                  onPressed: () {},
                  child: Text(
                    "UPLOAD",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold),
                  )))
        ]));
  }
}
