import 'package:flutter/material.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/chat/chat_screen.dart';

class ModuleScreen extends StatelessWidget {
  final UserModel user;
  final Course course;

  const ModuleScreen({required this.user, required this.course, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: course.modules.length,
        itemBuilder: (context, index) {
          final module = course.modules[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreenPage(
                    user: user,
                    courseName: course.name,
                    moduleName: module,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Card(
                child: ListTile(
                  title: Text(module),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}