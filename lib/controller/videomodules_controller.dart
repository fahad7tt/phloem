import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phloem_app/model/videomodules_model.dart';

class VideoController extends ChangeNotifier {
  final Map<String, VideoModule> _videoModules = {};

  Map<String, VideoModule> get videoModules => _videoModules;

  Future<void> updateVideoUrl(VideoModule videoModule) async {
    _videoModules[videoModule.moduleName] = videoModule;
    notifyListeners();

    // Store the video module in Firestore
    await FirebaseFirestore.instance.collection('recordings').add({
      'moduleName': videoModule.moduleName,
      'moduleDescription': videoModule.moduleDescription,
      'videoUrl': videoModule.videoUrl,
    });
  }

   // Method to fetch video URL from Firestore using moduleName
  Future<String?> getVideoUrlFromFirestore(String moduleName) async {
    try {
      // Query Firestore for the document matching moduleName
      final querySnapshot = await FirebaseFirestore.instance
          .collection('recordings')
          .where('moduleName', isEqualTo: moduleName)
          .get();

      // If document exists, return the videoUrl
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first['videoUrl'];
      } else {
        // If document doesn't exist, return null or handle accordingly
        return null;
      }
    } catch (e) {
      // Handle any errors
      // ignore: avoid_print
      print('Error fetching video URL: $e');
      return null;
    }
  }
}