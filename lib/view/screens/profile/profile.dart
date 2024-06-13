import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/signout_controller.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/widgets/bottom%20navbar/bottom_navbar.dart';
import 'app_info.dart';
import 'privacy_policy.dart';
import 'profile_list.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'terms_conditions.dart';

class ProfilePage extends StatefulWidget {
  final UserModel user;

  const ProfilePage({super.key, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<String> _fetchVersionInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<void> _showEditProfileDialog(BuildContext context) async {
    final TextEditingController nameController = TextEditingController(text: widget.user.userName);

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                const Text('Enter your new name:'),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'New name',
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () async {
                final newName = nameController.text.trim();
                if (newName.isNotEmpty) {
                  // Update the user name in Firestore
                  await FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .update({'username': newName});

                  // Update the local UserModel instance
                  setState(() {
                    widget.user.userName = newName;
                  });

                  // Show a snackbar message
                  Get.snackbar(
                    'Success',
                    'Your name has been updated.',
                    snackPosition: SnackPosition.BOTTOM,
                  );

                  // Close the dialog
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: const Text('User Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            SizedBox(
              width: 150,
              height: 150,
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: const Color.fromRGBO(0, 70, 128, 1),
                    radius: 36,
                    child: Text(
                      widget.user.userName.isNotEmpty ? widget.user.userName[0].toUpperCase() : '',
                      style: const TextStyle(
                        fontSize: 42,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.user.userName,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
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
                _showEditProfileDialog(context);
              },
            ),
            ProfileListTile(
              leading: const Icon(Icons.info),
              title: 'App Info',
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AppInfo()),
                );
              },
            ),
            ProfileListTile(
              leading: const Icon(Icons.policy),
              title: 'Privacy Policy',
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PrivacyPolicy()),
                );
              },
            ),
            ProfileListTile(
              leading: const Icon(Icons.file_copy),
              title: 'Terms and Conditions',
              trailing: const Icon(Icons.arrow_forward_ios, size: 20),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Terms()),
                );
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
            const SizedBox(height: 40),
            FutureBuilder<String>(
              future: _fetchVersionInfo(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Error fetching version'));
                } else {
                  return ListTile(
                    subtitle: Center(
                      child: Text(
                        'Version: ${snapshot.data}',
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(user: widget.user),
    );
  }
}