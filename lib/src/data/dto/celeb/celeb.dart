import 'package:egomoya/src/data/dto/celeb/celeb_item.dart';
import 'package:egomoya/src/data/enum/celeb_type.dart';

class Celeb {
  Celeb({
    required this.category,
    required this.imgPath,
    this.instaLink,
    required this.celebName,
    this.itemList,
  });
  final CelebPostCategory category;
  final String imgPath;
  final String? instaLink;
  final String celebName;
  final List<CelebItem>? itemList;
  @override
  String toString() {
    return 'Celeb(imgPath: $imgPath, instaLink: $instaLink, celebName: $celebName, itemList: $itemList)';
  }
}
