import 'package:amazon/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'news_model.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel {
  @JsonKey(name: 'news')
  List<NewsModel>? newsList;

  @JsonKey(name: 'mobile')
  List<ProductModel>? mobilesList;

  @JsonKey(name: 'makeup')
  List<ProductModel>? makeupList;
  @JsonKey(name: 'discount')
  List<ProductModel>? discountList;
  @JsonKey(name: 'AmazingOffer')
  List<ProductModel>? amazingOffer;


  @JsonKey(name: 'products')
  List<ProductModel>? products;

  BaseModel(
      this.newsList,
      this.mobilesList,
      this.makeupList,
      this.amazingOffer,
      this.discountList,this.products);

  factory BaseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseModelToJson(this);
}
