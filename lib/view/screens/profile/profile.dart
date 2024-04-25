import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/signout_controller.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';
import 'profile_list.dart';

class ProfilePage extends StatelessWidget {
  final String userEmail; 
  final String userImage; 

  const ProfilePage({super.key, required this.userEmail, required this.userImage});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 6),
          SizedBox(
            width: 150,
            height: 150,
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(userImage),
                  radius: 42,
                ),
                const SizedBox(height: 8),
                Text(
                  userEmail,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.only(right: 180.0),
            child: Text(
              'Profile Settings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 6),
          ProfileListTile(
            leading: const Icon(Icons.person),
            title: 'Edit Profile',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              
            },
          ),
          ProfileListTile(
            leading: const Icon(Icons.settings),
            title: 'Settings',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              
            },
          ),
          ProfileListTile(
            leading: const Icon(Icons.payment),
            title: 'Payment Methods',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              
            },
          ),
          ProfileListTile(
            leading: const Icon(Icons.info),
            title: 'Privacy Policy',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              
            },
          ),
          ProfileListTile(
            leading: const Icon(Icons.file_copy),
            title: 'Terms and Conditions',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              
            },
          ),
          ProfileListTile(
            leading: const Icon(Icons.logout),
            title: 'Sign out',
            trailing: const Icon(Icons.arrow_forward_ios, size: 20),
            onTap: () {
              // Show confirmation dialog before signing out
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm Sign Out"),
                    content: const Text("Are you sure you want to sign out?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          // Call signOut method from SignOutController
                          Get.find<SignOutController>().signOut();
                          Navigator.of(context).pop();
                        },
                        child: const Text("Sign Out"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
       bottomNavigationBar: BottomNavigationBarWidget(),
    );
  }
}