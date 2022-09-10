import 'package:amazon/models/gallery_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';
@JsonSerializable()
class ProductModel {
  String? id;
  String? catId;
  String? catName;
  String? title;
  String? brand;
  String? garanti;
  String? count;
  String? shortDescription;
  String? fullDescription;
  String? special;
  String? discount;
  String? rate;
  String? price;
  String? icon;
  List<GalleryModel>? gallery;
  ProductModel(
      this.id,
      this.catId,
      this.catName,
      this.title,
      this.brand,
      this.garanti,
      this.count,
      this.shortDescription,
      this.fullDescription,
      this.special,
      this.discount,
      this.rate,
      this.price,
      this.icon,
      this.gallery);

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

}
