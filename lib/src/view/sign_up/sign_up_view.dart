import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/sign_up/sign_up_view_model.dart';
import 'package:egomoya/theme/component/app_bar/base_app_bar.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
    this.args,
  });
  final SignUpViewArgument? args;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: SignUpViewModel(
        args: args,
      ),
      builder: (context, viewModel) {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: const Scaffold(
            appBar: BaseAppBar(
              title: '',
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
