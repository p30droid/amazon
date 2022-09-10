import 'package:amazon/models/base_category.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/base_model.dart';
part 'rest_client.g.dart';
@RestApi(baseUrl: 'https://androidsupport.ir/pack/digiAndroid/')
abstract class RestClient {

  factory RestClient(Dio dio)= _RestClient;

  @GET('home.php')
  Future<BaseModel> getHome();
  
  @GET('getCategories.php')
  Future<BaseCategory> getCategories();

  @GET('getProductCategory.php')
  Future<BaseModel> getProductCategory(@Query("catId")String id);
}