import 'package:egomoya/src/service/theme_service.dart';
import 'package:egomoya/theme/foundation/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    required this.controller,
    this.title,
    this.isRequired,
    this.onChanged,
    this.keyboardType,
    this.hintText,
    this.errorText,
    this.maxLines,
    this.inputFormatters,
  });
  final TextEditingController controller;
  final String? title;
  final bool? isRequired;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? errorText;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Row(
            children: [
              Text(
                title!,
                style: context.typo.body1.bold,
              ),
              const SizedBox(width: 3),
              if (isRequired == true)
                Text(
                  '*',
                  style: context.typo.body1.pointColor.bold,
                ),
            ],
          ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          onChanged: onChanged,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            hintText: hintText,
            errorText: errorText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
