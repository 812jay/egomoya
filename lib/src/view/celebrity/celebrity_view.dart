import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/celebrity/celebrity_view_model.dart';
import 'package:flutter/material.dart';

class CelebrityView extends StatelessWidget {
  const CelebrityView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CelebrityViewModel(),
      builder: (context, viewModel) {
        return Scaffold(
          body: Container(
            child: const Text('CelebrityView'),
          ),
        );
      },
    );
  }
}
