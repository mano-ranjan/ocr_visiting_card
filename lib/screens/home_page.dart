import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ocr_app/screens/data_screen.dart';
import 'package:ocr_app/utils/utility.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OCR Flutter App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Select an option"),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await getImageFromCamera().then((imagePath) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DataScreen(
                        imagePath: imagePath,
                      ),
                    ),
                  );
                });
              },
              child: const Text('Scan'),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                await getImageFromGallery(context).then((imagePath) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DataScreen(
                        imagePath: imagePath,
                      ),
                    ),
                  );
                });
              },
              child: const Text('Upload'),
            ),
          ),
        ],
      ),
    );
  }
}
