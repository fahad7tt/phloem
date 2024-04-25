import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screens/splash screen/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Learning Application',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}