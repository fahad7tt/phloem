// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phloem_app/controller/mentor_get.dart';
// import 'package:phloem_app/model/course_model.dart';
// import 'package:phloem_app/model/users_model.dart';
// import 'package:phloem_app/view/screens/modules.dart';
// // import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:phloem_app/controller/videomodules_controller.dart';

// class CourseDetailsScreen extends StatefulWidget {
//   final Course course;
//   final UserModel user;

//   const CourseDetailsScreen({super.key, required this.course, required this.user});

//   @override
//   // ignore: library_private_types_in_public_api
//   _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
// }

// class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
//   // final Razorpay _razorpay = Razorpay();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//   bool _hasVideoModules = false;

//   @override
//   void initState() {
//     super.initState();
//     // _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, (response) {
//     //   _handlePaymentErrorResponse(response, _scaffoldKey.currentContext!);
//     // });
//     // _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, (response) {
//     //   _handlePaymentSuccessResponse(response, _scaffoldKey.currentContext!);
//     // });
//     // _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, (response) {
//     //   _handleExternalWalletSelected(response, _scaffoldKey.currentContext!);
//     // });
//     _checkForVideoModules();
//   }

//   Future<void> _checkForVideoModules() async {
//     VideoController videoController = VideoController();
//     for (String module in widget.course.modules) {
//       String? videoUrl = await videoController.getVideoUrlFromFirestore(module);
//       if (videoUrl != null) {
//         setState(() {
//           _hasVideoModules = true;
//         });
//         break;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Text(widget.course.name),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Container(
//               padding: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.blue, width: 2.0),
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Text(
//                 'Payment Type: ${widget.course.payment}',
//                 style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
//               ),
//             ),
//             const SizedBox(height: 15),
//             if (widget.course.payment != 'free')
//               Container(
//                 padding: const EdgeInsets.all(8.0),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   color: const Color.fromARGB(255, 87, 96, 177),
//                 ),
//                 child: Text(
//                   '₹${widget.course.amount}',
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                       fontSize: 16,
//                       color: Colors.white),
//                 ),
//               ),
//             const SizedBox(height: 20),
//             const Text('Modules:',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//             const SizedBox(height: 12),
//             ...widget.course.modules.asMap().entries.map((entry) {
//               return Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ExpansionTile(
//                     title: Text(
//                       '${entry.key + 1}. ${entry.value}',
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.w400),
//                     ),
//                     children: [
//                       Align(
//                         alignment: Alignment.centerLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 16.0),
//                           child: Text(
//                             widget.course.descriptions[entry.key],
//                             style: const TextStyle(
//                                 fontSize: 16, color: Colors.black54),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                 ],
//               );
//             }),
//             const SizedBox(height: 10),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _hasVideoModules
//                     ? () {
//                         if (widget.course.payment == 'free') {
//                           Get.find<MentorController>()
//                               .mentorProvider
//                               .enrollCourse(widget.course, widget.user);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     FreeModulesPage(course: widget.course)),
//                           );
//                         } else if (widget.course.payment == 'paid') {
//                           // var amount = (double.parse(widget.course.amount) * 100).toInt();
//                           // var options = {
//                           //   'key': 'rzp_test_5CvknA4rDqeKqA',
//                           //   'amount': amount,
//                           //   'name': 'Phloem',
//                           //   'description': 'Course Payment',
//                           //   "timeout": "180",
//                           //   "currency": "INR",
//                           //   'retry': {'enabled': true, 'max_count': 1},
//                           //   'send_sms_hash': true,
//                           //   'prefill': {
//                           //     'contact': '9584847474',
//                           //     'email': 'test@razorpay.com'
//                           //   },
//                           // };
//                           // _razorpay.open(options);
//                           Get.find<MentorController>()
//                               .mentorProvider
//                               .enrollCourse(widget.course, widget.user);
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) =>
//                                     FreeModulesPage(course: widget.course)),
//                           );
//                         }
//                       }
//                     : null,
//                 child: Text(_hasVideoModules
//                     ? (widget.course.payment == 'free'
//                         ? 'Enroll for Free'
//                         : 'Enroll Now')
//                     : 'Currently Unavailable'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // void _handlePaymentErrorResponse(
//   //     PaymentFailureResponse response, BuildContext context) {
//   //   showAlertDialog(
//   //     context,
//   //     "Payment Failed",
//   //     "Code: ${response.code}\nDescription: ${response.message}",
//   //   );
//   // }

//   // void _handlePaymentSuccessResponse(
//   //     PaymentSuccessResponse response, BuildContext context) {
//   //   showAlertDialog(
//   //     context,
//   //     "Payment Successful",
//   //     "Payment ID: ${response.paymentId}",
//   //   ).then((_) {
//   //     Get.find<MentorController>()
//   //         .mentorProvider
//   //         .enrollCourse(widget.course, widget.user);
//   //     Navigator.push(
//   //       context,
//   //       MaterialPageRoute(
//   //           builder: (context) => FreeModulesPage(course: widget.course)),
//   //     );
//   //   });
//   // }

//   // void _handleExternalWalletSelected(
//   //     ExternalWalletResponse response, BuildContext context) {
//   //   showAlertDialog(
//   //     context,
//   //     "External Wallet Selected",
//   //     "${response.walletName}",
//   //   );
//   // }

//   Future<void> showAlertDialog(
//       BuildContext context, String title, String message) {
//     Widget continueButton = ElevatedButton(
//       child: const Text("Continue"),
//       onPressed: () {
//         Navigator.pop(context);
//       },
//     );

//     AlertDialog alert = AlertDialog(
//       title: Text(title),
//       content: Text(message),
//       actions: [continueButton],
//     );

//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phloem_app/controller/mentor_get.dart';
import 'package:phloem_app/model/course_model.dart';
import 'package:phloem_app/model/users_model.dart';
import 'package:phloem_app/view/screens/modules/modules.dart';
import 'package:phloem_app/controller/videomodules_controller.dart';

class CourseDetailsScreen extends StatefulWidget {
  final Course course;
  final UserModel user;

  const CourseDetailsScreen({super.key, required this.course, required this.user});

  @override
  // ignore: library_private_types_in_public_api
  _CourseDetailsScreenState createState() => _CourseDetailsScreenState();
}

class _CourseDetailsScreenState extends State<CourseDetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _hasVideoModules = false;

  @override
  void initState() {
    super.initState();
    _checkForVideoModules();
  }

  Future<void> _checkForVideoModules() async {
    VideoController videoController = VideoController();
    for (String module in widget.course.modules) {
      String? videoUrl = await videoController.getVideoUrlFromFirestore(module);
      if (videoUrl != null) {
        setState(() {
          _hasVideoModules = true;
        });
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.course.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Payment Type: ${widget.course.payment}',
                style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ),
            const SizedBox(height: 15),
            if (widget.course.payment != 'free')
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color.fromARGB(255, 87, 96, 177),
                ),
                child: Text(
                  '₹${widget.course.amount}',
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            const SizedBox(height: 20),
            const Text('Modules:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 12),
            ...widget.course.modules.asMap().entries.map((entry) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExpansionTile(
                    title: Text(
                      '${entry.key + 1}. ${entry.value}',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            widget.course.descriptions[entry.key],
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            }),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: _hasVideoModules
                    ? () {
                        Get.find<MentorController>()
                            .mentorProvider
                            .enrollCourse(widget.course, widget.user);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  FreeModulesPage(course: widget.course)),
                        );
                      }
                    : null,
                child: Text(_hasVideoModules
                    ? (widget.course.payment == 'free'
                        ? 'Enroll for Free'
                        : 'Enroll Now')
                    : 'Currently Unavailable'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> showAlertDialog(
      BuildContext context, String title, String message) {
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [continueButton],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}