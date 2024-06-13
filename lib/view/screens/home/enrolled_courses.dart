import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/modules/modules.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';

// ignore: must_be_immutable
class EnrolledCoursesPage extends StatelessWidget {
  final UserModel user;
  
  const EnrolledCoursesPage(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final mentorController = Get.put(MentorController());

    // Fetch enrolled courses from Firestore when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      mentorController.mentorProvider.fetchEnrolledCourses(user);
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.3,
        title: const Text('Enrolled Courses'),
      ),
      body: Obx(() {
         if (mentorController.mentorProvider.isLoadingState.value) {
          return const Center(child: Text('Loading...')); // Show loading message
        }

          final enrolledCourses = mentorController.mentorProvider.enrolledCourses;

          if (enrolledCourses.isEmpty) {
            return const Center(
              child: Text('No enrolled courses yet'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.only(top: 16.0),
            itemCount: enrolledCourses.length, 
            itemBuilder: (context, index) {
              final course = enrolledCourses[index];
              return ListTile(
                title: Card(
                  color: const Color.fromARGB(255, 18, 82, 134),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course.name,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 227, 232, 235),
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          child: Text(
                            course.payment == 'free' ? 'FREE' : '₹${course.amount}',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 227, 232, 235),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Get.to(() => FreeModulesPage(course: course));
                },
              onLongPress: () async {
                bool confirmDelete = await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Confirm Deletion'),
                    content: const Text('Are you sure you want to delete this course?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('Delete'),
                      ),
                    ],
                  ),
                );

                if (confirmDelete) {
                  await mentorController.mentorProvider.deleteEnrolledCourse(user, course);
                }
              },
            );
          },
        );
      }),
       bottomNavigationBar: BottomNavigationBarWidget(user: user),
    );
  }
}