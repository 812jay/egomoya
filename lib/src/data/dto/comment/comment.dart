import 'package:egomoya/src/data/dto/user/user.dart';

class Comment {
  Comment({
    required this.dataList,
    required this.pageInfo,
  });
  final List<CommentData> dataList;
  final CommentPageInfo pageInfo;

  @override
  String toString() {
    return 'Comment(dataList: $dataList, pageInfo: $pageInfo)';
  }
}

class CommentData {
  CommentData({
    required this.id,
    this.content,
    this.user,
    this.children,
    required this.createdAt,
    required this.updatedAt,
  });
  final int id;
  final String? content;
  final User? user;
  final List<CommentData>? children;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  String toString() {
    return 'CommentData(id: $id, content: $content, user: $user, children: $children)';
  }
}

class CommentPageInfo {
  CommentPageInfo({
    required this.pageNumber,
    required this.pageSize,
    required this.last,
    required this.total,
  });
  final int pageNumber;
  final int pageSize;
  final bool last;
  final int total;

  @override
  String toString() {
    return 'CommentPageInfo(pageNumber: $pageNumber, pageSize: $pageSize, last: $last, total: $total)';
  }
}
