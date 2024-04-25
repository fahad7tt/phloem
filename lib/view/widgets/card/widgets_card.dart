// // ignore_for_file: unused_element
// import 'package:flutter/material.dart';

// class Cards{
// Widget _buildCategoryItem(String categoryName) {
//   return Container(
//     margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
//     decoration: BoxDecoration(
//       color: const Color.fromARGB(255, 230, 230, 230),
//       borderRadius: BorderRadius.circular(18.0),
//     ),
//     child: TextButton(
//       onPressed: () {},
//       style: TextButton.styleFrom(
//         foregroundColor: Colors.black54,
//       ),
//       child: Text(
//         categoryName,
//         style: const TextStyle(
//           fontSize: 14.0,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildVideoCard(String title, String subtitle, String price) {
//   return Align(
//     alignment: Alignment.centerLeft,
//     child: SizedBox(
//       height: 168,
//       width: 150,
//       child: Card(
//         clipBehavior: Clip.antiAliasWithSaveLayer,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(11.0),
//         ),
//         elevation: 6,
//         margin: const EdgeInsets.all(1.0),
//         child: InkWell(
//           onTap: () {},
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Material(
//                 color: Colors.transparent,
//                 child: Ink.image(
//                   image: const AssetImage('images/video_black.png'),
//                   height: 100,
//                   width: 152,
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               Container(
//                 margin: const EdgeInsets.only(left: 6.0, top: 4.0),
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 224, 149, 36),
//                     fontSize: 14.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 6.0, top: 2.0),
//                 child: Text(
//                   subtitle,
//                   style: const TextStyle(
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 7.0, top: 2.0),
//                 child: Text(
//                   price,
//                   style: const TextStyle(
//                     color: Color.fromARGB(255, 18, 134, 230),
//                     fontSize: 13.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }

// Widget _buildMentorCard(String imagePath, String mentorName) {
//   return SizedBox(
//     height: 117,
//     width: 106,
//     child: Card(
//       clipBehavior: Clip.antiAliasWithSaveLayer,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12.0),
//       ),
//       elevation: 6,
//       margin: const EdgeInsets.all(1.0),
//       child: Column(
//         children: [
//           Image.asset(
//             imagePath,
//             height: 93,
//             width: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(4.0),
//             child: Text(
//               mentorName,
//               style: const TextStyle(
//                 fontSize: 10.0,
//                 fontWeight: FontWeight.bold,
//               ),
//               textAlign: TextAlign.center,
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }