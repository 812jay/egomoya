import 'package:egomoya/src/view/base_view_model.dart';
import 'package:egomoya/theme/component/circular_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatelessWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.builder,
  });

  final T viewModel;
  final Widget Function(BuildContext context, T viewModel) builder;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: CircularIndicator(
        isBusy: viewModel.isBusy,
        child: builder(context, viewModel),
      ),
    );
  }
}
