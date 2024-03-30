import 'package:flutter/material.dart';

class ContentImageBox extends StatelessWidget {
  const ContentImageBox({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 284,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
