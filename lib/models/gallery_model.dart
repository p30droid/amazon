import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class GalleryModel {
  String? img;

  GalleryModel(this.img);

  factory GalleryModel.fromJson(Map<String, dynamic> json) => _$GalleryModelFromJson(json);
  Map<String, dynamic> toJson() => _$GalleryModelToJson(this);

}