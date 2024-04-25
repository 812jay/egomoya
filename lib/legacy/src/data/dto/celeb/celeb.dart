import 'package:egomoya/legacy/src/data/dto/celeb/celeb_item.dart';
import 'package:egomoya/legacy/src/data/enum/celeb_type.dart';

class Celeb {
  Celeb({
    required this.category,
    required this.imgPath,
    this.instaLink,
    required this.celebName,
    this.itemList,
    required this.likeCnt,
    required this.createdAt,
    required this.updatedAt,
  });
  final CelebPostCategory category;
  final String imgPath;
  final String? instaLink;
  final String celebName;
  final List<CelebItem>? itemList;
  final int likeCnt;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Celeb(imgPath: $imgPath, instaLink: $instaLink, celebName: $celebName, itemList: $itemList, likeCnt: $likeCnt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
