import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'controller/mentor_controller.dart';
import 'controller/signout_controller.dart';
import 'firebase_options.dart';
import 'repository/authentication_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform).then(
      (FirebaseApp value) => Get.put(AuthenticationRepository),
    );
     Get.put(SignOutController());
     Get.put(MentorProvider());
  runApp(const MyApp());
}