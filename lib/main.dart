import 'package:amazon/controller/amazon_binding.dart';
import 'package:amazon/di/simple_contact.dart';
import 'package:amazon/di/user_model.dart';
import 'package:amazon/pages/about/about_page.dart';
import 'package:amazon/pages/category/category_page.dart';
import 'package:amazon/pages/dashboard/dashboard_page.dart';
import 'package:amazon/pages/home/home_page.dart';
import 'package:amazon/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'di/advanced_contact.dart';
import 'localizations/message.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(GetMaterialApp(
    getPages: [
      GetPage(name: '/dashboard', page: () => DashboardPage() , binding: AmazonBinding()),
      GetPage(name: '/setting', page: () => SettingPage()),
      GetPage(name: '/home', page: () => HomePage()),
      GetPage(name: '/category', page: () => CategoryPage()),
      GetPage(name: '/about', page: ()=> AboutPage())
    ],
    initialRoute: '/dashboard',

    translations: Message(), // your translations
    locale: Locale('en', 'US'), // translations will be displayed in that locale

    //home: DashboardPage(),
  ));


  UserModel model = UserModel(contactModel: AdvancedContact());

  UserModel model2 = UserModel(contactModel: SimpleContact());

}
