import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vikn_codes/screens/bottom.dart';
import '../controllers/profile_cntrl.dart';

class ProfilePage extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000000), // Set background to black
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF0F0F0F),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundImage: NetworkImage('https://img.freepik.com/free-vector/portrait-boy-with-brown-hair-brown-eyes_1308-146018.jpg'), // Assuming you have an avatar image
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                controller.userName.value,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                              Obx(() => Text(
                                controller.email.value,
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 14,
                                ),
                              )),
                            ],
                          ),
                          SizedBox(width: 20,),
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit_note,size: 35,color: Colors.white,)),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Rating and KYC Status
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildInfoCard(Icons.star, "${controller.rating}", "${controller.rides} rides"),
                          _buildInfoCard(Icons.verified, "KYC", controller.isKycVerified.value ? "Verified" : "Not Verified"),
                        ],
                      ),
                      SizedBox(height: 20),

                      // Logout Button
                      ElevatedButton.icon(
                        onPressed: controller.logout,
                        icon: Icon(Icons.logout, color: Colors.red),
                        label: Text("Logout",style: TextStyle(color: Colors.red),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Dark grey color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Menu Options
                _buildMenuOption(Icons.help_outline, "Help"),
                _buildMenuOption(Icons.question_answer, "FAQ"),
                _buildMenuOption(Icons.group_add, "Invite Friends"),
                _buildMenuOption(Icons.description, "Terms of service"),
                _buildMenuOption(Icons.lock_outline, "Privacy Policy"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(IconData icon, String title, String subtitle) {
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Color(0xFF2D2D2D), // Darker grey color for the cards
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueAccent),
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.white54, size: 16),
      onTap: () {
        // Handle menu option tap
      },
    );
  }
}
