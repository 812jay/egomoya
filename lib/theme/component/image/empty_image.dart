import 'package:egomoya/theme/component/icon/asset_icon.dart';
import 'package:flutter/material.dart';

class EmptyImage extends StatelessWidget {
  const EmptyImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: AssetIcon(
          'assets/images/logo_icon.png',
          size: 60,
        ),
      ),
    );
  }
}
