import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:save_storage/screen/login_screen.dart';
import 'package:save_storage/screen/profile_screen.dart';
import 'package:save_storage/utils/app_syles.dart';
import 'package:save_storage/widget/text_filed.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Register",
                  style: Styles.headLineStyle
                      .copyWith(color: Colors.white, fontSize: 38),
                ),
                Text(
                  "Enter a beautiful world",
                  style: Styles.headLineStyle2.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              children: [
                const AppTextBox(
                    icon: Icons.person, text: "Enter your username"),
                const SizedBox(height: 20),
                const AppTextBox(
                    icon: FluentSystemIcons.ic_fluent_phone_filled,
                    text: "Enter your telephone"),
                const SizedBox(height: 20),
                const AppTextBox(
                    icon: FluentSystemIcons.ic_fluent_lock_filled,
                    text: "Enter your password"),
                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProfileScreen()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurple),
                      onPressed: () {
                        // Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()));
                      },
                      child: const Text(
                        "Back",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
