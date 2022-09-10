
import 'category_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'base_category.g.dart';
@JsonSerializable()
class BaseCategory {

  @JsonKey(name: 'categories')
  List<CategoryModel> categories;

  BaseCategory(this.categories);

  factory BaseCategory.fromJson(Map<String, dynamic> json) =>
      _$BaseCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$BaseCategoryToJson(this);

}