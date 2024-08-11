// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/user.dart';
//
// class ProfileController extends GetxController {
//   var user = Rxn<UserModel>();
//   var isLoading = false.obs;
//
//   @override
//   void onInit() {
//     fetchUserProfile();
//     super.onInit();
//   }
//
//   Future<void> fetchUserProfile() async {
//     isLoading(true);
//
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? userID = prefs.getString('userID');
//
//     final response = await http.get(
//       Uri.parse('https://www.api.viknbooks.com/api/v10/users/user-view/$userID/'),
//       headers: {"Content-Type": "application/json"},
//     );
//
//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       user.value = UserModel.fromJson(data);
//     } else {
//       Get.snackbar('Error', 'Failed to load profile');
//     }
//
//     isLoading(false);
//   }
// }
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var userName = "David Arnold".obs;
  var email = "david012@cabzing".obs;
  var rating = 4.3.obs;
  var rides = 2211.obs;
  var isKycVerified = true.obs;

  void logout() {
    // Implement logout logic here
  }
}
