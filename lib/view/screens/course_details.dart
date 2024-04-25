import 'package:flutter/material.dart';
import 'package:phloem_app/model/course_model.dart';

class CourseDetailsScreen extends StatelessWidget {
 final Course course;

 const CourseDetailsScreen({super.key, required this.course});

 @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Payment Type: ${course.payment}',
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Modules:', style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
            const SizedBox(height: 12),
            ...course.modules.asMap().entries.expand((entry) {
              return [
                Text(
                 '${entry.key + 1}. ${entry.value}',
                 style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 12),
              ];
            })
          ],
        ),
      ),
    );
 }
}
