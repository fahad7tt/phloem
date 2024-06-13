import 'package:flutter/material.dart';
import 'package:phloem_app/model/mentor_model.dart';

class MentorDetailsScreen extends StatelessWidget {
  final Mentor mentor;

  const MentorDetailsScreen({super.key, required this.mentor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 17,
              backgroundImage: NetworkImage(mentor.imageUrl),
            ),
            const SizedBox(width: 8.0),
            Text(mentor.name),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
        child: SizedBox(
          width: double.infinity,
          child: Card(
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                direction: Axis.vertical,
                spacing: 8.0,
                children: [
                  Text('Name: ${mentor.name}', style: const TextStyle(fontWeight: FontWeight.w500)),
                  Text('Email: ${mentor.email}', style: const TextStyle(fontWeight: FontWeight.w500)),
                  Text('Courses: ${mentor.courses}', style: const TextStyle(fontWeight: FontWeight.w500)),
                  Text('Modules: ${mentor.selectedModules.join(', ')}', style: const TextStyle(fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
