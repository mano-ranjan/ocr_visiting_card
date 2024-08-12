import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ocr_app/utils/utility.dart';

class DataScreen extends StatefulWidget {
  final String? imagePath;
  const DataScreen({
    super.key,
    required this.imagePath,
  });

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff113765),
              Color(0xff255B9B),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //checks for the image path being null or not and renders the image if the same is not null
              Visibility(
                visible: widget.imagePath != null,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Image.file(
                    File(widget.imagePath ?? ''),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Generated Text",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //call the text extrcation method that takes in the image path and gives a selectable text widget as output with the generated text
              extractTextView(widget.imagePath),
            ],
          ),
        ),
      ),
    );
  }
}
