import 'package:egomoya/legacy/theme/res/layout.dart';
import 'package:flutter/material.dart';

class ConstrainedView extends StatelessWidget {
  const ConstrainedView({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: Breakpoints.desktop,
        ),
        child: child,
      ),
    );
  }
}
