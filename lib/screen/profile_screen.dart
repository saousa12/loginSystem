import 'package:dio/dio.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:save_storage/screen/login_screen.dart';
import 'package:save_storage/utils/app_syles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic> profile = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getApi();
  }

  getApi() async {
    String path = "https://fake-json-api.mock.beeceptor.com/users/1";
    final dio = Dio();
    final response = await dio.get(path);
    setState(() {
      profile = response.data;
      // print(profile);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: profile.isEmpty
          ? Center(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingAnimationWidget.newtonCradle(
                    color: Colors.white,
                    size: 100,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Loading",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          : ListView(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 40),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 60,
                          child: Image(
                            image: NetworkImage(
                              profile["photo"],
                            ),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                    ),
                    Text(
                      profile["name"],
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                    ),
                    Text(
                      profile["country"],
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                const Icon(
                                    FluentSystemIcons.ic_fluent_phone_filled),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ),
                                Text(
                                  "Tel : ${profile["phone"]}",
                                  style:
                                      Styles.textStyle.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 8),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              children: [
                                const Icon(
                                    FluentSystemIcons.ic_fluent_mail_filled),
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ),
                                Text(
                                  "Email : ${profile["email"]}",
                                  style:
                                      Styles.textStyle.copyWith(fontSize: 12),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                              ),
                              onPressed: getApi,
                              child: const Text(
                                "get Image Api",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent,
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginScreen()));
                              },
                              child: const Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }
}
