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
  String? imagePath;
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
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // checks for image being null or not and renders the image if the same is not null
                Visibility(
                  visible: imagePath != null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: Image.file(
                        File(imagePath ?? ''),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () async {
                        //calls the get image from camera and saves the image path in the local variable that is used for conditinal rendering
                        await getImageFromCamera().then((returnImagePath) {
                          setState(() {
                            imagePath = returnImagePath;
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 104,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Scan",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      //calls the get image from gallery and saves the image path in the local variable that is used for conditinal rendering
                      onTap: () async {
                        await getImageFromGallery(context)
                            .then((returnImagePath) {
                          setState(() {
                            imagePath = returnImagePath;
                          });
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 104,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            10,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Upload",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                //checks for image path being null or not, and move the user to data screen if the same is not null
                InkWell(
                  onTap: imagePath != null
                      ? () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DataScreen(
                                imagePath: imagePath,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: Container(
                    height: 50,
                    width: 151,
                    decoration: BoxDecoration(
                      color: imagePath != null
                          ? Colors.white
                          : const Color(0xff6A706C),
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Process image",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color:
                              imagePath != null ? Colors.black : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            //this refreshes the state of the homepage, if the user wants to get the very first initial state
            Visibility(
              visible: imagePath != null,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        imagePath = null;
                      });
                    },
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
