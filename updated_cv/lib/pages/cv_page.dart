import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:updated_cv/pages/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _selectedImagePath;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImagePath = pickedFile.path;
      });
    }
  }

  // Log out function that navigates to the LoginPage
  void logOut(BuildContext context) {
    // Navigate to the LoginPage and remove all previous routes (logout)
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (route) => false, // Remove all previous routes from the stack
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.cyan[800],
        title: const Text(
          "MY CV",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.cyan[50],
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[800],
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 4,
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  "CV Sections",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.school_rounded),
              title: Text("E D U C A T I O N"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.account_tree_rounded),
              title: Text("S K I L L S"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.cases_rounded),
              title: Text("P R O J E C T S"),
            ),
            const Divider(),
            const ListTile(
              leading: Icon(Icons.stars_rounded),
              title: Text("E X P E R I E N C E"),
            ),
            const Spacer(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
                size: 30,
              ),
              title: const Text(
                "L O G  O U T",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () => logOut(context), // Log out action
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: _pickImage, // Allow the user to tap and pick an image
                    child: CircleAvatar(
                      radius: 80,
                      backgroundColor: Colors.lightBlue[100],
                      backgroundImage: _selectedImagePath != null
                          ? FileImage(File(_selectedImagePath!)) // Show the selected image
                          : null, // No background image by default
                      child: _selectedImagePath == null
                          ? Text(
                              "JP",
                              style: TextStyle(color: Colors.blue[900], fontSize: 70),
                            )
                          : null, // Hide text if an image is selected
                    ),
                  ),
                  const SizedBox(height: 8), // Space between avatar and label
                  const Text(
                    "Tap to upload your profile picture",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Justine Padua",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 1.5),
          Text(
            "+63 916 578 1497",
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          Text(
            "padua.chrisjustine13@gmail.com",
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              height: 150,
              width: 335,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.white30, width: 1), // Added border
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Professional Goal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}