import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/mentor_model.dart';
import 'package:phloem_app/view/screens/home/mentor_details_screen.dart';

class AllMentorsScreen extends StatelessWidget {
  const AllMentorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mentorController = Get.find<MentorController>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.grey[400],
        title: const Text('All Mentors'),
      ),
      body: FutureBuilder<List<Mentor>>(
        future: mentorController.mentorProvider.fetchMentors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No mentors available'));
          } else {
            final mentors = snapshot.data!;
            return ListView.builder(
              itemCount: mentors.length,
              itemBuilder: (context, index) {
                final mentor = mentors[index];
                return Container(
                  color: index.isEven ? Colors.white : Colors.grey[200],
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(mentor.imageUrl),
                    ),
                    title: Text(mentor.name),
                    onTap: () {
                      Get.to(MentorDetailsScreen(mentor: mentor));
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
