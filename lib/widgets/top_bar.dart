// ignore_for_file: must_be_immutable
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/widgets/text_widget.dart';
import '../utils/imageConstants.dart';


class TopBar extends StatelessWidget {
  String name, amount, value;
  bool isLoading;
   TopBar({Key? key,required this.value,required this.amount,required this.name,required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 17, right: 17,bottom:Platform.isIOS? 10:5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(logo,height: 20),
              Row(
                children: [
                  Image.asset(notification,height: 22),
                  const SizedBox(width: 20),
                  const Icon(Icons.search,color: AppColors.white,size: 30,)
                ],
              )
            ],
          ),
          const SizedBox(height: 20),
         isLoading? Shimmer.fromColors(
           baseColor: AppColors.backcolor,
           highlightColor: AppColors.greyColor22,
           child: TextWidget(text: "Hey, User", color: AppColors.white, fontWeight: FontWeight.bold, size: 18),
         ):TextWidget(text: "Hey, $name", color: AppColors.white, fontWeight: FontWeight.bold, size: 18),
          isLoading? Shimmer.fromColors(
            baseColor: AppColors.backcolor,
            highlightColor: AppColors.greyColor22,
            child: TextWidget(text:"\$ 0.00", color: AppColors.white,family: "OpenSans-Bold", size: 26),
          ):TextWidget(text: amount.toString()=="null"?"\$ 0.00":amount.toString(), color: AppColors.white,family: "OpenSans-Bold", size: 26),
          isLoading? Shimmer.fromColors(
            baseColor: AppColors.backcolor,
            highlightColor: AppColors.greyColor22,
            child: TextWidget(text: "Portfolio Value", color: AppColors.white, fontWeight: FontWeight.w600, size: 12),
          ):TextWidget(text: value.toString(), color: AppColors.white, fontWeight: FontWeight.w600, size: 12),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
