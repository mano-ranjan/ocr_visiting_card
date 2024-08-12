import 'dart:async';
import 'dart:io';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:permission_handler/permission_handler.dart';

Future<String?> getImageFromCamera() async {
  bool isCameraGranted = await Permission.camera.request().isGranted;
  if (!isCameraGranted) {
    isCameraGranted =
        await Permission.camera.request() == PermissionStatus.granted;
  }

  if (!isCameraGranted) {
    return null;
  }

  // Generate filepath for saving
  String imagePath = join(
      (await path_provider.getApplicationSupportDirectory()).path,
      "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

  bool success = false;

  try {
    success = await EdgeDetection.detectEdge(
      imagePath,
      canUseGallery: true,
      androidScanTitle: 'Scanning', // use custom localizations for android
      androidCropTitle: 'Crop',
      androidCropBlackWhiteTitle: 'Black White',
      androidCropReset: 'Reset',
    );
    print("success: $success");
  } catch (e) {
    print(e);
  }

  // if (!mounted) return null;
  return success ? imagePath : null;
}

Future<String?> getImageFromGallery(BuildContext context) async {
  String imagePath = join(
      (await path_provider.getApplicationSupportDirectory()).path,
      "${(DateTime.now().millisecondsSinceEpoch / 1000).round()}.jpeg");

  bool success = false;
  try {
    success = await EdgeDetection.detectEdgeFromGallery(
      imagePath,
      androidCropTitle: 'Crop', // use custom localizations for android
      androidCropBlackWhiteTitle: 'Black White',
      androidCropReset: 'Reset',
    );
  } catch (e) {
    print(e);
  }

  return success ? imagePath : null;
}

Widget extractTextView(String? imagePath) {
  if (imagePath == null) {
    return const Text("No data");
  }
  return FutureBuilder(
    future: extractText(File(imagePath)),
    builder: (context, snapshot) {
      return SelectableText(
        snapshot.data ?? "",
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      );
    },
  );
}

Future<String?> extractText(File file) async {
  final textRecognizer = TextRecognizer(
    script: TextRecognitionScript.latin,
  );
  final InputImage inputImage = InputImage.fromFile(file);
  final RecognizedText recognizedText =
      await textRecognizer.processImage(inputImage);
  String text = recognizedText.text;
  return text;
}
