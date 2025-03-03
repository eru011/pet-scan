import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:petscan/constants/colors.dart';

class Paw extends StatefulWidget {
  const Paw({super.key});

  @override
  _PawState createState() => _PawState();
}

class _PawState extends State<Paw> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _openCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.background,
      appBar: AppBar(
        title: Image.asset(
          'assets/logo2.png',
          height: 45,
        ),
        backgroundColor: Col.cardBackground,
      ),
      body: Column(
        children: [
          // Top section for image and camera button
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: _image == null
                        ? const Center(
                            child: Text(
                              "No image selected",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                // Camera button positioned at the bottom of the image container
                Positioned(
                  bottom: 24,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: ElevatedButton.icon(
                      onPressed: _openCamera,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Col.primary,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      icon: const Icon(Icons.camera_alt, color: Colors.white),
                      label: const Text(
                        "Take Photo",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Bottom scrollable section for prediction details
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Analysis Results",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Col.primary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildSection("Prediction", "Awaiting scan..."),
                    _buildSection("Causes", "Will be displayed after scan"),
                    _buildSection("Definition", "Will be displayed after scan"),
                    _buildSection("Remedies", "Will be displayed after scan"),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
