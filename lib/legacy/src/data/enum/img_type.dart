enum ImgType {
  post,
  profile,
}

extension ImgTypeExt on ImgType {
  bool get isPost => this == ImgType.post;
  bool get isProfile => this == ImgType.profile;
}
