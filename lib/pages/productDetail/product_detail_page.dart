import 'package:amazon/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../widgets/text/persian_bold_text.dart';
import '../../widgets/text/persian_text.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

   List<Widget> widgetsList=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.product.gallery!.forEach((element) {

      widgetsList.add(Image.network('${element.img}'));

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF007185),
        title: PersianText(title: '${widget.product.title}',fontSize: 14.0,),
      ),
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          ImageSlideshow(

            /// Width of the [ImageSlideshow].
            width: double.infinity,

            /// Height of the [ImageSlideshow].
            height: 200,

            /// The page to show when first creating the [ImageSlideshow].
            initialPage: 0,

            /// The color to paint the indicator.
            indicatorColor: Colors.blue,

            /// The color to paint behind th indicator.
            indicatorBackgroundColor: Colors.grey,

            /// The widgets to display in the [ImageSlideshow].
            /// Add the sample image file into the images folder
            children: widgetsList,

            /// Called whenever the page in the center of the viewport changes.
            onPageChanged: (value) {
              print('Page changed: $value');
            },

            /// Auto scroll interval.
            /// Do not auto scroll with null or 0.
            autoPlayInterval: 3000,

            /// Loops back to first slide.
            isLoop: true,
          ),
         Row(

           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [

             Row(
               children: [
                 SizedBox(width: 20,),
                 Text('${widget.product.price}' ,style: TextStyle(
                     fontSize: 20.0,
                   fontFamily: 'IRANSans',
                   color: Colors.red
                 ),) ,
                 SizedBox(width: 20,),
                 PersianText(title: 'قیمت' , fontSize: 20.0,) ,


               ],

             ),
             ElevatedButton(onPressed: (){}, child:
             PersianText(title: 'افزدن به سبد خرید' , fontSize: 12.0,) ,
               style: ElevatedButton.styleFrom(
                   primary: Colors.red
               ),)

           ],

         ),
           Card(

             child: Padding(
               padding: EdgeInsets.only(top: 10.0 , bottom: 10),
               child: Column(crossAxisAlignment: CrossAxisAlignment.end,

                 children: [
                   PersianBoldText(title: 'توضیحات کوتاه',fontSize: 16.0,),
                   SizedBox(height: 10,),
                   Text(widget.product.shortDescription! , style:
                   TextStyle(fontFamily: 'IRANSans'),) ,
                   RatingBar.builder(
                     initialRating: double.parse(
                         '${widget.product.rate}'),
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
                   Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       PersianBoldText(title: '${widget.product.count}',fontSize: 16.0,),
                       SizedBox(width: 10,),
                       PersianText(title: 'تعداد موجودی',fontSize: 16.0,),
                     ],

                   ),
                   Container(
                     width: 140,
                     height: 40,
                     decoration: BoxDecoration(
                       color: Colors.amber, 
                       borderRadius: BorderRadius.circular(16.0)
                     ),
                     child: Center(
                       child: PersianText(title: ' برند  ${widget.product.brand} ',fontSize: 16.0,),
                     ),
                   )
                 ],

               )),
             )


        ],

      ),

    );
  }
}
