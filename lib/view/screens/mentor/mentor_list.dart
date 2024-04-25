import 'package:flutter/material.dart';
import 'package:phloem_app/model/mentorinfo_model.dart';

class MentorPage extends StatelessWidget {
  const MentorPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Define _mentorData here
    // ignore: no_leading_underscores_for_local_identifiers
    List<MentorInfo> _mentorData = [
      MentorInfo(
        imagePath: 'images/mentor_black.jpg',
        name: 'John Doe',
        subtitle: 'Chemistry Expert',
      ),
      MentorInfo(
        imagePath: 'images/mentor_black.jpg',
        name: 'Jane Smith',
        subtitle: 'Mathematics Specialist',
      ),
      MentorInfo(
        imagePath: 'images/mentor_black.jpg',
        name: 'Alex Johnson',
        subtitle: 'Physics Guru',
      ),
      MentorInfo(
        imagePath: 'images/mentor_black.jpg',
        name: 'Jason Roy',
        subtitle: 'English Proficient',
      ),
      MentorInfo(
        imagePath: 'images/mentor_black.jpg',
        name: 'Manav Foe',
        subtitle: 'Biology Enthusiast',
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFF5F9FF),
        appBar: AppBar(
          title: const Text('Mentors', style: TextStyle(fontWeight: FontWeight.w500)),
          backgroundColor: const Color(0xFFF5F9FF),
          elevation: 1,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ListView.separated(
            itemCount: _mentorData.length,
            itemBuilder: (context, index) {
              return _buildMentorTile(_mentorData[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.grey,
                thickness: 0.2,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildMentorTile(MentorInfo mentors) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(mentors.imagePath),
      ),
      title: Text(mentors.name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(mentors.subtitle, style: const TextStyle(fontSize: 12.0)),
      onTap: () { 
        // Handle tap on mentor tile
      },
    );
  }
}