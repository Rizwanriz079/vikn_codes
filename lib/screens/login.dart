import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login.dart';

class LoginScreen extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF1E1E2A),
                  Color(0xFF121212),
                ],
              ),
            ),
          ),
          // Language Selector
          Positioned(
            top: 50,
            right: 24,
            child: Row(
              children: [
                Icon(Icons.language, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'English',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          // Centered Content
          Positioned(
            top: 150,  // Adjust this value to increase/decrease space
            left: 0,
            right: 0,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Obx(
                      () => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Login to your vkin account",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                TextField(
                                  controller: controller.usernameController,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.person,
                                        color: Colors.blueAccent),
                                    hintText: "Username",
                                    hintStyle:
                                    TextStyle(color: Colors.white70),
                                    border: InputBorder.none,
                                  ),
                                ),
                                Divider(color: Colors.white30),
                                TextField(
                                  controller: controller.passwordController,
                                  obscureText:
                                  !controller.isPasswordVisible.value,
                                  style: TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    icon: Icon(Icons.lock,
                                        color: Colors.blueAccent),
                                    hintText: "Password",
                                    hintStyle:
                                    TextStyle(color: Colors.white70),
                                    border: InputBorder.none,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.isPasswordVisible.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                      onPressed: controller
                                          .togglePasswordVisibility,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgotten Password?",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          ),
                        ],
                      ),
                      controller.isLoading.value
                          ? CircularProgressIndicator()
                          : ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign in",
                                style: TextStyle(color: Colors.white)),
                            SizedBox(width: 5),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 190),
                      Text(
                        "Don't have an Account?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: () {
                          // Handle sign up
                        },
                        child: Text(
                          "Sign up now!",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
