

import 'package:flutter/material.dart';

class PersianText extends StatelessWidget {
  final title;
  final fontSize;
   const PersianText({Key? key, required this.fontSize ,required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final plus = 1+ 2;
    final name=  DateTime.now();
    return Text('$title' , style: TextStyle(fontFamily: 'IRANSans' ,
    fontSize: fontSize),overflow: TextOverflow.ellipsis,);
  }
}
