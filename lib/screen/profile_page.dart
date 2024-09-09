import 'dart:io';

import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

TextEditingController fnameController = TextEditingController();
TextEditingController lnameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController emailController = TextEditingController();

Map<String, dynamic> profile = {
  "image": "",
  "fname": "ดาว",
  "lname": "ท้องฟ้า",
  "phone": "1234",
  "email": "dao@gmail.com",
};
bool isButton = false;

class _ProfilePageState extends State<ProfilePage> {
  File? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fnameController.text = profile["fname"];
    lnameController.text = profile["lname"];
    phoneController.text = profile["phone"];
    emailController.text = "Hello world";
  }

  bool checkButton() {
    if (emailController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() {
        this.image = imageTemporary;
        profile["image"] = image.path;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Widget ImageContainer() {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (profile["image"] != "")
          CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(File(profile["image"]), scale: 20))
        else
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage("assets/images/user.png"),
          ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.01,
          left: MediaQuery.of(context).size.width * 0.55,
          child: CircleAvatar(
            radius: 15,
            backgroundColor: Colors.white.withOpacity(0.6),
            child: InkWell(
                onTap: () {
                  ShowImagePicker(context);
                },
                child: const Icon(
                  FluentSystemIcons.ic_fluent_camera_filled,
                  size: 20,
                )),
          ),
        ),
      ],
    );
  }

  Future ShowImagePicker(BuildContext context) {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(),
      context: context,
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 5,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                  },
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_image_filled),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                      const Text("แกลลอรี่"),
                    ],
                  )),
              Expanded(child: Divider()),
              InkWell(
                  onTap: () {
                    pickImage(ImageSource.camera);
                  },
                  child: Row(
                    children: [
                      const Icon(FluentSystemIcons.ic_fluent_camera_filled),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                      ),
                      const Text("กล้อง"),
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }

  Future OpenDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 80,
                        margin: const EdgeInsets.only(top: 40),
                        child: const Image(
                            image: AssetImage("assets/images/R.png")),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      const Text(
                        "แก้ไขโปรไฟล์สำเร็จ",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 0.0,
                  top: 0.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.blue,
                      size: 15,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
          title: const Text(
            "แก้ไขโปรไฟล์",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: Container(
            padding: const EdgeInsets.all(12.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_sharp,
                  size: 15,
                  color: Colors.blue,
                ),
                onPressed: () {
                  print("You are tap");
                },
              ),
            ),
          ),
          backgroundColor: Colors.blueGrey.shade50,
        ),
        body: ListView(
          children: [
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ImageContainer()),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ข้อมูลโปรไฟล์",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10.0),
                  ),
                  Column(
                    children: [
                      profileContainer("ชื่อ", fnameController),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      ),
                      profileContainer("นามสกุล", lnameController),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      ),
                      profileContainer("เบอร์โทรศัพท์", phoneController),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                      ),
                      profileContainer("อีเมล", emailController),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: new Row(
            children: [
              Expanded(
                  child: OutlinedButton(
                      onPressed: isButton
                          ? () {
                              fnameController.text = profile["fname"];
                              lnameController.text = profile["lname"];
                              phoneController.text = profile["phone"];
                              emailController.text = profile["email"];
                              setState(() {
                                isButton = false;
                              });
                            }
                          : null,
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                              color: isButton
                                  ? Colors.blue
                                  : Colors.grey.shade300)),
                      child: Text(
                        "ยกเลิก",
                        style: TextStyle(
                            color:
                                isButton ? Colors.blue : Colors.grey.shade300,
                            fontWeight: FontWeight.bold),
                      ))),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
              ),
              Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue),
                      onPressed: isButton
                          ? () {
                              setState(() {
                                profile["fname"] = fnameController.text;
                                profile["lname"] = lnameController.text;
                                profile["phone"] = phoneController.text;
                                profile["email"] = emailController.text;
                              });
                              OpenDialog(context);
                              setState(() {
                                isButton = false;
                              });
                            }
                          : null,
                      child: const Text(
                        "บันทึก",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))),
            ],
          ),
        ));
  }
}

Widget profileContainer(String label, TextEditingController controller) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        TextFormField(
          decoration: const InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10)),
          controller: controller,
          onChanged: (value) {
            isButton = value.isNotEmpty;
          },
          style: const TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}
