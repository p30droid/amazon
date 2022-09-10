

import 'package:get/get.dart';

import 'counter_controller.dart';

class AmazonBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(CounterController());

    //change code



  }


}