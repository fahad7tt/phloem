import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: controller.selectedIndex.value,
        onTap: (index) {
          controller.changeIndex(index);
          // Navigate to the respective screen based on index
          switch (index) {
            case 0:
              Get.to(() => const HomePage());
              break;
            case 1:
              // Navigate to Inbox screen
              break;
            case 2:
              // Navigate to Transaction screen
              break;
            case 3:
              // Navigate to Profile screen
               Get.to(() => const ProfilePage(
            userEmail: 'johndoe@gmail.com',
            userImage: 'images/mentor_black.jpg',
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