
import 'package:get/get.dart';

class Message extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {


    'en_US': {
      'hello': 'Hello World',
      'home': 'Home',
      'category': 'Category',
      'setting' : 'Setting',
      'about' : 'About',
      'mobile' : 'Best Mobiles',
      'makeup' : 'Best Beauties',
      'discount' : 'Best Beauties',
    },
    'fa_IR': {
      'hello': 'سلام',
      'home': 'خانه',
      'category': 'دسته بندی',
      'setting' : 'تنظیمات',
      'about' : 'درباره ما',
      'mobile' : 'برترین موبایل ها',
      'makeup' : 'برترین محصولات زیبایی',
    }



  };

}