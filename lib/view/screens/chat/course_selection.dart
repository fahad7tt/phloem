import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/chat/course_modules_page.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';

// ignore: must_be_immutable
class EnrolledChatPage extends StatelessWidget {
  final UserModel user;
  
  const EnrolledChatPage(this.user, {super.key});

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
        title: const Text('Community'),
      ),
      body: Obx(() {
         if (mentorController.mentorProvider.isLoadingState.value) {
          return const Center(child: Text('Loading...'));
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
                title: Padding(
                  padding: const EdgeInsets.all(11.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.name,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  Get.to(() => ModuleScreen(course: course, user: user));
                },
            );
          },
        );
      }),
       bottomNavigationBar: BottomNavigationBarWidget(user: user),
    );
  }
}