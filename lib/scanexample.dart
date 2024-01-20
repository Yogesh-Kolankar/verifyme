import 'dart:io';

import 'package:flutter/material.dart';

class ScanExample extends StatefulWidget {
  File? photo;
  ScanExample({required this.photo, super.key});

  @override
  State<ScanExample> createState() => _ScanExampleState();
}

class _ScanExampleState extends State<ScanExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Image.file(widget.photo!));
  }
}
