// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:upwork_test/widgets/category_widget.dart';
import '../models/categories_model.dart';
import '../utils/app_colors.dart';
import '../widgets/text_widget.dart';

class TopCategories extends StatelessWidget {
  List<Category> categoryData;
   TopCategories({Key? key,required this.categoryData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: "Top Categories", color: AppColors.blackLight, size: 22,family: "OpenSans-Bold",),
            Row(
              children: [
                TextWidget(text: "See All", color: AppColors.lightBlue2, fontWeight: FontWeight.w600, size: 14),
                const SizedBox(width: 2),
                const Icon(Icons.chevron_right,color: AppColors.lightBlue2,size: 20,)
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 110,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context,index){
              return index==4?Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin:const EdgeInsets.only(right: 10),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFE5F8FF),
                    ),
                    child: ClipRRect(
                      borderRadius:
                      BorderRadius.circular(10),
                      child:const Icon(Icons.arrow_forward_rounded,color: AppColors.lightBlue2,size:25,),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: 65,
                      child: TextWidget(text: "See All", color: AppColors.blackLight, size: 12))
                ],
              ):
              CategoryWidget(data:categoryData[index]);
            },itemCount: 5,),
        )
      ],
    );
  }
}
