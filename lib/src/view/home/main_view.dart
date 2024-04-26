import 'package:egomoya/src/repo/celeb_repo.dart';
import 'package:egomoya/src/repo/image_repo.dart';
import 'package:egomoya/src/view/base_view.dart';
import 'package:egomoya/src/view/home/main_view_model.dart';
import 'package:egomoya/theme/component/main_sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MainViewModel(
        celebRepo: context.read<CelebRepo>(),
        imageRepo: context.read<ImageRepo>(),
      ),
      builder: (context, viewModel) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget>[
                const MainSliverAppBar(),
              ];
            },
            body: ListView.builder(
              itemCount: viewModel.celebList.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 20,
              ),
              itemBuilder: (context, index) {
                final celeb = viewModel.celebList[index];

                return Column(
                  children: [
                    Text(celeb.celebName),
                    if (celeb.imgPath != null)
                      Stack(
                        children: [
                          Image.network(celeb.imgPath!),
                          if (celeb.itemList != null)
                            SizedBox(
                              height: 30,
                              child: ListView.separated(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: celeb.itemList!.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(width: 10),
                                itemBuilder: (context, index) {
                                  final item = celeb.itemList![index];
                                  if (item.imgPath != null) {
                                    return Image.network(item.imgPath!);
                                  }
                                  return Text(item.itemName);
                                },
                              ),
                            )
                        ],
                      )
                    else
                      const Text('empty'),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
