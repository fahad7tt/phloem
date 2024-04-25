import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_controller.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/view/screens/course_details.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  // ignore: use_super_parameters
  const HomePage({Key? key}) : super(key: key);
  // final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final mentorProvider = Get.find<MentorProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FF),
      body: SingleChildScrollView(
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
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'Search category...',
              //     prefixIcon: const Icon(Icons.search),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //   ),
              // ),
              // const SizedBox(height: 25.0),
              Card(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0),
                ),
                elevation: 2,
                margin:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
              const SizedBox(height: 22.0),
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
                          // Handle the 'View All' button press
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
                      future: mentorProvider.fetchCourses(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const CircularProgressIndicator(); // Show loading indicator while waiting for data
                        } else if (snapshot.hasError) {
                          return const Text('Error loading courses'); // Show error message if there's an error
                        } else {
                          return ListView(
                            scrollDirection: Axis.horizontal,
                            children: snapshot.data!.map((course) => _buildCategoryItem(context, course)).toList(),
                          );
                        }
                      },
                    ),
                 ),
                ],
              ),
              // const SizedBox(height: 14.0),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         const Text(
              //           'Modules',
              //           style: TextStyle(
              //             fontSize: 16.0,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         TextButton(
              //           onPressed: () {
              //             // Handle the 'View All' button press
              //           },
              //           child: const Text(
              //             'View All',
              //             style: TextStyle(
              //               fontSize: 13.0,
              //               color: Colors.blue,
              //             ),
              //           ),
              //         ), 
              //       ],
              //     ),
              //     SizedBox(
              //       height: 45.0,
              //       child: ListView(
              //         scrollDirection: Axis.horizontal,
              //         children: [
              //           _buildCategoryItem('All'),
              //           _buildCategoryItem('Molecules'),
              //           _buildCategoryItem('Trigonometry'),
              //           _buildCategoryItem('Laws of Motion'),
              //           _buildCategoryItem('Vocabulary'),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 14),
              Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Video Modules',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle the 'View All' button press
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
              const SizedBox(height: 8),

              // Card below Online Courses section
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildVideoCard('Biology', 'Photosynthesis', '650/-'),
                    const SizedBox(width: 22),
                    _buildVideoCard('Chemistry', 'Chemical Reactions', '750/-'),
                    const SizedBox(width: 22),
                    _buildVideoCard('Physics', 'Atoms and Molecules', 'FREE'),
                    const SizedBox(width: 22),
                    _buildVideoCard('Mathematics', 'Trigonometry', '950/-'),
                    const SizedBox(width: 22),
                    _buildVideoCard('English', 'Vocabulary', '600/-'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              //mentors list
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
                          // Handle the 'View All' button press
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
              const SizedBox(height: 8),
              //mentor cards
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildMentorCard('images/mentor_black.jpg', 'John Doe'),
                    const SizedBox(width: 14),
                    _buildMentorCard('images/mentor_black.jpg', 'Jane Smith'),
                    const SizedBox(width: 14),
                    _buildMentorCard('images/mentor_black.jpg', 'Alex Johnson'),
                    const SizedBox(width: 14),
                    _buildMentorCard('images/mentor_black.jpg', 'Jason Roy'),
                    const SizedBox(width: 14),
                    _buildMentorCard('images/mentor_black.jpg', 'Manav Foe'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }

  Widget _buildCategoryItem(BuildContext context, Course course) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 230, 230, 230),
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(course: course),
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

  Widget _buildVideoCard(String title, String subtitle, String price) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        height: 168,
        width: 150,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11.0),
          ),
          elevation: 6,
          margin: const EdgeInsets.all(1.0),
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Ink.image(
                    image: const AssetImage('images/video_black.png'),
                    height: 100,
                    width: 152,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 6.0, top: 4.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 224, 149, 36),
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6.0, top: 2.0),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, top: 2.0),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 18, 134, 230),
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMentorCard(String imagePath, String mentorName) {
    return SizedBox(
      height: 117,
      width: 106,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 6,
        margin: const EdgeInsets.all(1.0),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              height: 93,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                mentorName,
                style: const TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}