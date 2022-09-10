// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCategory _$BaseCategoryFromJson(Map<String, dynamic> json) => BaseCategory(
      (json['categories'] as List<dynamic>)
          .map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseCategoryToJson(BaseCategory instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };
