import 'package:flutter/material.dart';

class ContentImageBox extends StatelessWidget {
  const ContentImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/detail1.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
