

import 'package:amazon/models/base_model.dart';
import 'package:amazon/models/category_model.dart';
import 'package:amazon/widgets/text/persian_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:logger/logger.dart';

import '../../api/rest_client.dart';

class ProductsCategoryPage extends StatefulWidget {
  final CategoryModel category;
  const ProductsCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductsCategoryPage> createState() => _ProductsCategoryPageState();
}

class _ProductsCategoryPageState extends State<ProductsCategoryPage> {

  final logger = Logger();
  late Future<BaseModel> getProducts;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dio = Dio();
    final client = RestClient(dio);
    print('${widget.category.id}');
    getProducts = client.getProductCategory(widget.category.id!);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(


      appBar: AppBar(
        title: PersianText(title: '${widget.category.title}',fontSize: 14.0,),
      ),
      body: FutureBuilder<BaseModel>(
        future: getProducts,
        builder: (context , snapshot) {

        if(snapshot.hasData) {


            return    Container(
              height: 240,
              child: ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        width: 240,
                        child: Column(
                          children: [
                            Image.network(
                              '${snapshot.data!.products![index].icon}',
                              width: 200,
                              height: 144,
                            ),
                            PersianText(
                              title:
                              '${snapshot.data!.products![index].title}',
                              fontSize: 16.0,
                            ),
                            RatingBar.builder(
                              initialRating: double.parse(
                                  '${snapshot.data!.products![index].rate}'),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemSize: 30.0,
                              itemCount: 5,
                              itemPadding:
                              EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                            PersianText(
                              title:
                              '${snapshot.data!.products![index].price}',
                              fontSize: 18.0,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            );


        }
        else if(snapshot.hasError){
          return Text('Error ${snapshot.error}');
        }

        else {
          return CircularProgressIndicator();
        }


      },),



    );
  }
}
