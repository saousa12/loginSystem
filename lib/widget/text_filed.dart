import 'package:flutter/material.dart';
import 'package:save_storage/utils/app_syles.dart';

class AppTextBox extends StatelessWidget {
  final IconData icon;
  final String text;
  const AppTextBox({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade600, width: 2.0)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Styles.bgColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: Styles.bgColor),
          )
        ],
      ),
    );
  }
}
