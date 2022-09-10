

import 'package:amazon/controller/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    //CounterController controller = Get.put(CounterController());
    CounterController controller = Get.find<CounterController>();
    var data = Get.arguments;

    print('build');
    

    return Scaffold(
      appBar: AppBar(

      ),
      
      body: Column(
        
        children: [
          
          Text('$data'),
          Text('my value is ${data[0]}'),
          Text('my value is ${data[1]}'),


          Row(
            children: [

              ElevatedButton(onPressed: (){

                controller.increment();

              }, child: Text('+')),
              Obx(() => Text('${controller.counter}')),
              ElevatedButton(onPressed: (){

                controller.decrement();

              }, child: Text('-')),

            ],
          )

        ],
      ),
      
    );
  }
}
