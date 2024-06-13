import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/model/mentor_model.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/payment/course_details.dart';
import 'package:phloem_app/view/screens/home/all_courses.dart';
import 'package:phloem_app/view/screens/home/all_mentors.dart';
import 'package:phloem_app/view/screens/home/mentor_details_screen.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({super.key, required this.user});
  // final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mentorController = Get.find<MentorController>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
          future: Future.delayed(const Duration(milliseconds: 800)),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('Loading...'),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 40.0),
                      const Text(
                        'Welcome Home',
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 61, 109),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      const Text(
                        'What Would you like to learn Today?\nSearch Below.',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black45,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20.0),
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 8.0),
                        child: SizedBox(
                          height: 150,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              Image.asset(
                                'images/card_bg.jpg',
                                fit: BoxFit.fill,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                              const Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'PHLOEM',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Learn With Us',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Phloem aims at providing education to students at affordable rates.\nLet’s start!',
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Courses',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(AllCoursesPage(user: user));
                                },
                                child: const Text(
                                  'View All',
                                  style: TextStyle(
                                    fontSize: 13.0,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 45.0,
                            child: FutureBuilder<List<Course>>(
                              future: mentorController.mentorProvider
                                  .fetchCourses(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: AnimatedSlide(
                                          offset: Offset.zero,
                                          duration: Duration.zero));
                                } else if (snapshot.hasError) {
                                  return const Text('Error loading courses');
                                } else if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Text('No courses available');
                                } else {
                                  final courses = snapshot.data!;
                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        courses.length > 4 ? 4 : courses.length,
                                    itemBuilder: (context, index) {
                                      final course = courses[index];
                                      return _buildCategoryItem(
                                          context, course);
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     const Text(
                      //       'Video Modules',
                      //       style: TextStyle(
                      //         fontSize: 16.0,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //     TextButton(
                      //       onPressed: () {
                      //         // Handle the 'View All' button press
                      //       },
                      //       child: const Text(
                      //         'View All',
                      //         style: TextStyle(
                      //           fontSize: 13.0,
                      //           color: Colors.blue,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 8),
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       _buildVideoCard('Biology', 'Photosynthesis', '650/-'),
                      //       const SizedBox(width: 22),
                      //       _buildVideoCard('Chemistry', 'Chemical Reactions', '750/-'),
                      //       const SizedBox(width: 22),
                      //       _buildVideoCard('Physics', 'Atoms and Molecules', 'FREE'),
                      //       const SizedBox(width: 22),
                      //       _buildVideoCard('Mathematics', 'Trigonometry', '950/-'),
                      //       const SizedBox(width: 22),
                      //       _buildVideoCard('English', 'Vocabulary', '600/-'),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Mentors',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(const AllMentorsScreen());
                            },
                            child: const Text(
                              'View All',
                              style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      FutureBuilder<List<Mentor>>(
                        future: mentorController.mentorProvider.fetchMentors(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: AnimatedSlide(
                                    offset: Offset.zero,
                                    duration: Duration.zero));
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return const Text('No mentors available');
                          } else {
                            final mentors = snapshot.data!;
                            return SizedBox(
                              height: 122,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                        mentors.length > 4 ? 4 : mentors.length,
                                itemBuilder: (context, index) {
                                  final mentor = mentors[index];
                                  return _buildMentorCard(context, mentor);
                                },
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          }),
      bottomNavigationBar: BottomNavigationBarWidget(user: user),
    );
  }

  Widget _buildCategoryItem(BuildContext context, Course course) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseDetailsScreen(
                course: course,
                user: user,
              ),
            ),
          );
        },
        style: TextButton.styleFrom(
          foregroundColor: Colors.black54,
        ),
        child: Text(
          course.name,
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

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

   Widget _buildMentorCard(BuildContext context, Mentor mentor) {
    return SizedBox(
      width: 95,
      child: GestureDetector(
        onTap: () {
          Get.to(() => MentorDetailsScreen(mentor: mentor));
        },
        child: Card(
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          elevation: 3,
          margin: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Image.network(
                  mentor.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  mentor.name,
                  style: const TextStyle(
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}