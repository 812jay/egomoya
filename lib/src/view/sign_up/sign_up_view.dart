import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignUpViewModel(),
      builder: (context, viewModel) {
        return const Scaffold();
      },
    );
  }
}
