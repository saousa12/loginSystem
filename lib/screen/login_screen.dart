import 'dart:ui';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:save_storage/screen/profile_screen.dart';
import 'package:save_storage/screen/register_screen.dart';
import 'package:save_storage/utils/app_syles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade300,
      appBar: AppBar(
        backgroundColor: Styles.bgColor,
        title: const Center(
          child: Text(
            "Login System",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.purple,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 60,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: Column(
              children: [
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    fillColor: Colors.purple,
                    labelText: "Enter your username",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(FluentSystemIcons.ic_fluent_mail_filled),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passController,
                  decoration: InputDecoration(
                    labelText: "Enter your password",
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock),
                    suffix: InkWell(
                      onTap: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                      child: Icon(
                          passToggle ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
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
                        "Login",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterScreen()));
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(color: Styles.bgColor, fontSize: 18),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
