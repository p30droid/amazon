import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';
@JsonSerializable()
class NewsModel {
  String? id;
  String? title;
  String? icon;
  String? type;
  String? link;

  NewsModel(this.id, this.title, this.icon, this.type, this.link);

  factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
  Map<String, dynamic> toJson() => _$NewsModelToJson(this);


}