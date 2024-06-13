import 'package:flutter/material.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/controller/videomodules_controller.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FreeModulesPage extends StatelessWidget {
  final Course course;

  const FreeModulesPage({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules - ${course.name}'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: _fetchModuleNamesWithUrls(course.modules), // Fetch module names and corresponding video URLs
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No videos found for this course.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                String moduleName = snapshot.data!.keys.elementAt(index);
                String videoUrl = snapshot.data![moduleName]!;
                return ModuleTile(moduleName: moduleName, videoUrl: videoUrl);
              },
            );
          }
        },
      ),
    );
  }

  // Function to fetch module names and corresponding video URLs for the course modules
  Future<Map<String, String>> _fetchModuleNamesWithUrls(List<String> modules) async {
    Map<String, String> moduleNamesWithUrls = {};
    VideoController videoController = VideoController();

    for (String module in modules) {
      String? videoUrl = await videoController.getVideoUrlFromFirestore(module);
      if (videoUrl != null) {
        moduleNamesWithUrls[module] = videoUrl;
      }
    }

    return moduleNamesWithUrls;
  }
}

class ModuleTile extends StatelessWidget {
  final String moduleName;
  final String videoUrl;

  const ModuleTile({super.key, required this.moduleName, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      onTap: () {
        // Navigate to a page to display video
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerPage(videoUrl: videoUrl),
          ),
        );
      },
    );
  }
}

class VideoPlayerPage extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         Expanded(
          child: Center(
            child: YoutubePlayer(
              controller: controller,
              showVideoProgressIndicator: true,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}