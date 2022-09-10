import 'dart:ffi';

import 'package:amazon/ads/admob_service.dart';
import 'package:amazon/api/rest_client.dart';
import 'package:amazon/models/base_model.dart';
import 'package:amazon/pages/productDetail/product_detail_page.dart';
import 'package:amazon/widgets/text/persian_bold_text.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../widgets/text/persian_text.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logger = Logger();
  late Future<BaseModel> getHome;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final dio = Dio();
    final client = RestClient(dio);
    //   Future<BaseModel> getHome= client.getHome().then((it) {
    //   logger.i(it);
    //});

    AdMobService.intestialLoad();

    getHome = client.getHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BaseModel>(
        future: getHome,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: MediaQuery.of(context).size.height - 100,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CarouselSlider.builder(
                      options: CarouselOptions(height: 300.0, autoPlay: true, autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      itemCount: snapshot.data!.amazingOffer!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                            width: MediaQuery.of(context).size.width,height: 300.0,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                image: NetworkImage(
                                  '${snapshot.data!.amazingOffer!.elementAt(itemIndex).icon}' ,

                                )
                              )
                            ),



                          ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 16, bottom: 16),
                      child: PersianBoldText(
                        title: 'mobile'.tr,
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: snapshot.data!.mobilesList!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute
                                    (builder: (context)=>ProductDetailPage(product: snapshot.data!.mobilesList![index])));
                                },
                                child: Card(
                                  child: Container(
                                    width: 240,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.mobilesList![index].icon}',
                                          width: 200,
                                          height: 144,
                                        ),
                                        PersianText(
                                          title:
                                          '${snapshot.data!.mobilesList![index].title}',
                                          fontSize: 16.0,
                                        ),
                                        RatingBar.builder(
                                          initialRating: double.parse(
                                              '${snapshot.data!.mobilesList![index].rate}'),
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
                                          '${snapshot.data!.mobilesList![index].price}',
                                          fontSize: 18.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 16, bottom: 16),
                      child: PersianBoldText(
                        title: 'makeup'.tr,
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: snapshot.data!.makeupList!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                width: 240,
                                child: Column(
                                  children: [
                                    Image.network(
                                      '${snapshot.data!.makeupList![index].icon}',
                                      width: 200,
                                      height: 144,
                                    ),
                                    PersianText(
                                      title:
                                          '${snapshot.data!.makeupList![index].title}',
                                      fontSize: 16.0,
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          '${snapshot.data!.makeupList![index].rate}'),
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
                                          '${snapshot.data!.makeupList![index].price}',
                                      fontSize: 18.0,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 16, bottom: 16),
                      child: PersianBoldText(
                        title: 'discount'.tr,
                        fontSize: 18.0,
                      ),
                    ),
                    Container(
                      height: 240,
                      child: ListView.builder(
                          itemCount: snapshot.data!.discountList!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                width: 240,
                                child: Column(
                                  children: [
                                    Image.network(
                                      '${snapshot.data!.discountList![index].icon}',
                                      width: 200,
                                      height: 144,
                                    ),
                                    PersianText(
                                      title:
                                      '${snapshot.data!.discountList![index].title}',
                                      fontSize: 16.0,
                                    ),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          '${snapshot.data!.discountList![index].rate}'),
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
                                      '${snapshot.data!.discountList![index].price}',
                                      fontSize: 18.0,
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ) ,
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(bottom: 16.0),
                      child: AdWidget(
                        key: UniqueKey(),
                        ad: AdMobService.createBannerAds()..load(),
                      ) ,
                    )
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text('error');
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
