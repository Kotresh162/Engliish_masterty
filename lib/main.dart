import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/controllers/courses_controller.dart';
import 'package:login_signup/screens/welcome_screen.dart';

// Adjust the import path as necessary

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  Get.put(CoursesController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Name',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen(),
    );
  }
}
