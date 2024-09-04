import 'package:flutter/material.dart';
import 'package:save_storage/screen/discount_page.dart';
import 'package:save_storage/utils/app_syles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: ThemeData(primaryColor: primary),
      home: DiscountPage(),
    );
  }
}
