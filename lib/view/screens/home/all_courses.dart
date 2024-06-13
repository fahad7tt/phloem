import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/payment/course_details.dart';

class AllCoursesPage extends StatelessWidget {
  final UserModel user;

  const AllCoursesPage({required this.user, super.key});

  @override
  Widget build(BuildContext context) {
    final mentorController = Get.find<MentorController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.grey[400],
        title: const Text('All Courses'),
      ),
      body: FutureBuilder<List<Course>>(
        future: mentorController.mentorProvider.fetchCourses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error loading courses'),
            );
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length + 1,
              itemBuilder: (context, index) {
                if (index == courses.length) {
                  // Last index, no course item
                  return const SizedBox.shrink();
                } else {
                  final course = courses[index];
                  return Container(
                    color: index.isEven ? Colors.white : Colors.grey[200],
                    child: ListTile(
                      title: Text(course.name),
                      onTap: () {
                        Get.to(() => CourseDetailsScreen(course: course, user: user));
                      },
                    ),
                  );
                }
              },
            );
          }
        },
      ),
    );
  }
}