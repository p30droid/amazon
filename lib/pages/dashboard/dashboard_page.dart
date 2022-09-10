
import 'package:amazon/pages/category/category_page.dart';
import 'package:amazon/pages/home/home_page.dart';
import 'package:amazon/pages/setting/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:get/get.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  int _currentItem=0;
  List<Widget> widgetsList=[HomePage(),CategoryPage(),SettingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('assets/image/amazon.png' , width: 120,height: 40,)

          ],
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF007185),
      ),
      bottomNavigationBar:
      SalomonBottomBar(
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('home'.tr),
              selectedColor: Colors.pink
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.category),
            title: Text('category'.tr),
              selectedColor: Colors.pink

          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text('setting'.tr),
            selectedColor: Colors.pink
          ),
        ],
        currentIndex: _currentItem,
        onTap: (value){
          setState((){
            _currentItem = value.toInt();
          });
        },

      ),

   /*   BottomNavigationBar(
        selectedItemColor: Colors.pink,
        currentIndex: _currentItem,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home)
              ,label: 'Home'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.category)
              ,label: 'Category'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.settings)
              ,label: 'Settings'
          )
        ],
        onTap: (value){
         setState( (){
           _currentItem =  value.toInt();
         } );
        },

      )*/

      body: widgetsList.elementAt(_currentItem),

    );
  }
}
