import 'package:json_annotation/json_annotation.dart';

part 'image_req.g.dart';

@JsonSerializable()
class ImageReq {
  ImageReq({
    required this.fileList,
  });
  @JsonKey(name: 'files')
  final String fileList;

  factory ImageReq.fromJson(Map<String, dynamic> json) =>
      _$ImageReqFromJson(json);

  Map<String, dynamic> toJson() => _$ImageReqToJson(this);
}
