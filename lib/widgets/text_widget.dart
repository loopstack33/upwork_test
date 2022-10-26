// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  Color color;
  String text;
  FontWeight? fontWeight;
  double size;
  String? family;
  TextWidget({Key? key,required this.text,required this.color,this.fontWeight,required this.size,this.family}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: size,color: color,fontFamily:family ?? "OpenSans",fontWeight:fontWeight),textAlign: TextAlign.center,);
  }
}
