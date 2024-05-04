import 'package:flutter/material.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    super.key,
    required this.child,
    required this.isBusy,
  });

  final Widget child;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isBusy,
      child: Stack(
        children: [
          child,

          /// CircularIndicator
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: isBusy ? 1 : 0,
            child: Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(
                value: isBusy ? null : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
