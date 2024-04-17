import 'package:json_annotation/json_annotation.dart';

part 'img_req.g.dart';

@JsonSerializable()
class ImgReq {
  ImgReq({
    required this.uploadName,
    this.isProfile,
  });
  @JsonKey(name: 'uploadName')
  final String uploadName;
  @JsonKey(name: 'isProfile')
  final bool? isProfile;

  factory ImgReq.fromJson(Map<String, dynamic> json) => _$ImgReqFromJson(json);

  Map<String, dynamic> toJson() => _$ImgReqToJson(this);
}
