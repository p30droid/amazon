

import 'package:amazon/localizations/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/counter_controller.dart';
import '../about/about_page.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {

   // CounterController controller = Get.put(CounterController());

    CounterController controller = Get.find<CounterController>();

    return Scaffold(
      body: Column(


        children: [

          ElevatedButton(onPressed: (){

            //Get.to(AboutPage());
            Get.toNamed('/about' , arguments: ['click',2]);

          }, child: Text('about'.tr)),


          ElevatedButton(onPressed: (){


            var locale = Locale('fa', 'IR');
            Get.updateLocale(locale);


          }, child: Text('Localizations')),


          Text('hello'.tr),

          Row(

            children: [

              ElevatedButton(onPressed: (){


                Get.changeTheme(ThemeData.dark());



              }, child: Text('Dark')),


              ElevatedButton(onPressed: (){


                Get.changeTheme(ThemeData.light());



              }, child: Text('Light')),

            ],

          ),
          
          Row(
            children: [

              ElevatedButton(onPressed: (){


                Get.changeTheme(ThemeData.light());


                SnackBar snackBar = SnackBar(content: Text('Welcome'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);


              }, child: Text('Snackbar')),

              ElevatedButton(onPressed: (){



                Get.snackbar('Hello', 'sample text');



              }, child: Text('Snackbar GetX')),


            ],
          ),
          
          Obx(() => Text('${controller.counter}'))


        ],

      ),
    );
  }
}
