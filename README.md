# OCR Visiting Card App

This Flutter project is an Optical Character Recognition (OCR) application designed to extract text from visiting cards. It utilizes various Flutter packages and external libraries to provide a seamless user experience for capturing, processing, and displaying text from images.

## Features

- Capture images using the device camera
- Select images from the device gallery
- Extract text from images using OCR technology
- Display extracted text in a user-friendly format

## External Libraries Used

The following external libraries are used in this project:

1. **edge_detection: ^1.1.3**
   - Used for detecting edges in images, which can improve OCR accuracy.

2. **google_mlkit_text_recognition: ^0.11.0**
   - Provides the core OCR functionality using Google's ML Kit.

3. **permission_handler: ^10.2.0**
   - Handles runtime permissions for camera and storage access.

4. **path_provider: ^2.1.1**
   - Helps in accessing and managing file paths on the device.

5. **image: ^4.0.15**
   - Used for image processing and manipulation.

## Getting Started

To run this project:

1. Ensure you have Flutter installed on your machine.
2. Clone this repository.
3. Run `flutter pub get` to install dependencies.
4. Connect a device or start an emulator.
5. Run `flutter run` to start the app.

## Project Structure

The main application code is located in the `lib` directory.
