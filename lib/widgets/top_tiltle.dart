import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TopTitles extends StatelessWidget {
  const TopTitles({super.key, required this.title, required this.subTitle});
  final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: kToolbarHeight + 12),
        if (title == 'Login' || title == 'Create Account')
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios, size: 35),
          ),
        const SizedBox(height: 35),
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          subTitle,
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
