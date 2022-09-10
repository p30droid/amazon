import 'package:amazon/models/base_category.dart';
import 'package:amazon/pages/productCategory/products_category_page.dart';
import 'package:amazon/widgets/text/persian_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../api/rest_client.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final logger = Logger();
  late Future<BaseCategory> getCategory;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();
    final client = RestClient(dio);

    getCategory = client.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BaseCategory>(
        future: getCategory,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height - 100,
              child: GridView.count(
                  crossAxisCount: 2,
                children: List.generate(snapshot.data!.categories.length, (index) {
                  return

                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context)=>
                                ProductsCategoryPage(category: snapshot.data!.categories[index] ,)));
                      },
                      child: Card(
                          child: Container(
                            child: Column(children: [

                              Image.network('${snapshot.data!.categories[index].icon}', width: 140,height: 140,
                                fit: BoxFit.cover,),
                              SizedBox(height: 10,),
                              PersianText(
                                title: '${snapshot.data!.categories[index].title}',
                                fontSize: 12.0,
                              )

                            ],),
                          )),
                    );
                }),

                  ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
