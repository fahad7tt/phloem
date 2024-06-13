// import 'package:flutter/material.dart';
// import 'package:phloem_app/controller/videomodules_controller.dart';

// class VideoDisplayPage extends StatelessWidget {
//   final String moduleName;

//   const VideoDisplayPage({Key? key, required this.moduleName}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final videoController = context.watch<VideoController>();
//     final videoModule = videoController.videoModules[moduleName];
//     final videoUrl = videoModule?.videoUrl ?? '';

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Display'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: Center(
//               child: YoutubePlayer(
//                 controller: YoutubePlayerController(
//                   initialVideoId: videoUrl.isNotEmpty ? YoutubePlayer.convertUrlToId(videoUrl) ?? '' : '',
//                   flags: const YoutubePlayerFlags(
//                     autoPlay: true,
//                     mute: false,
//                   ),
//                 ),
//                 showVideoProgressIndicator: true,
//                 bottomActions: [
//                   CurrentPosition(),
//                   ProgressBar(
//                     isExpanded: true,
//                     colors: const ProgressBarColors(
//                       playedColor: Colors.red,
//                       bufferedColor: Colors.grey,
//                     ),
//                   ),
//                   RemainingDuration(),
//                   const PlaybackSpeedButton(),
//                   FullScreenButton(),
//                 ],
//                 onReady: () {
//                   print('Player is ready.');
//                 },
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               // Navigate back to the mentor home page
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//             child: const Text('Done'),
//           ),
//         ],
//       ),
//     );
//   }
// }