

import 'package:flutter/material.dart';

class PersianBoldText extends StatelessWidget {
  final title;
  final fontSize;
  const PersianBoldText({Key? key, required this.fontSize ,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plus = 1+ 2;
    final name=  DateTime.now();
    return Text('$title' , style: TextStyle(fontFamily: 'IRANSans',fontWeight: FontWeight.w800 ,
    fontSize: fontSize),overflow: TextOverflow.ellipsis,);
  }
}
