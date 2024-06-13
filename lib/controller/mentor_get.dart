// mentor_controller.dart
import 'package:get/get.dart';
import 'mentor_controller.dart';

class MentorController extends GetxController {
  final MentorProvider _mentorProvider = MentorProvider();

  MentorProvider get mentorProvider => _mentorProvider;
}