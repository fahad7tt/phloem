  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_controller.dart';
import 'package:phloem_app/controller/signin_controller.dart';
  import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/chat/course_selection.dart';
  import 'package:phloem_app/view/screens/home/enrolled_courses.dart';
  import 'package:phloem_app/view/screens/home/home.dart';
  import 'package:phloem_app/view/screens/profile/profile.dart';

  class BottomNavigationBarController extends GetxController {
    var selectedIndex = 0.obs;

    void changeIndex(int index) {
      selectedIndex.value = index;
    }
  }

  // ignore: use_key_in_widget_constructors
  class BottomNavigationBarWidget extends StatelessWidget {

    final UserModel user;

    BottomNavigationBarWidget({super.key, required this.user});
    
    final BottomNavigationBarController controller =
        Get.put(BottomNavigationBarController());

    @override
    Widget build(BuildContext context) {
      return GetBuilder<BottomNavigationBarController>(
        builder: (_) => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: 'Inbox',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.payment),
              label: 'Enrolled',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: controller.selectedIndex.value,
          onTap: (index) async {
            final mentorName = await MentorProvider().getMentorName(SignInController.mentorEmail!);
            controller.changeIndex(index);
            // Navigate to the respective screen based on index
            switch (index) {
              case 0:
                Get.to(() => HomePage(user: user));
                break;
              case 1:
              // ignore: avoid_print
              print(mentorName);
                Get.to(() => EnrolledChatPage(user));
                break;
              case 2:
                Get.to(() => EnrolledCoursesPage(user));
                break;
              case 3:
                Get.to(() => ProfilePage(
                  user: user,
            ));
                break;
            }
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          type: BottomNavigationBarType.fixed,
        ),
      );
    }
  }