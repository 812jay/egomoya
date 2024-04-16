import 'package:json_annotation/json_annotation.dart';

part 'image_req.g.dart';

@JsonSerializable()
class ImageReq {
  ImageReq({
    required this.uploadName,
    this.isProfile,
  });
  @JsonKey(name: 'uploadName')
  final String uploadName;
  @JsonKey(name: 'isProfile')
  final bool? isProfile;

  factory ImageReq.fromJson(Map<String, dynamic> json) =>
      _$ImageReqFromJson(json);

  Map<String, dynamic> toJson() => _$ImageReqToJson(this);
}
