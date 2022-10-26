// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:upwork_test/models/brands_model.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/widgets/text_widget.dart';
import '../widgets/brands_widget.dart';

class TopBrand extends StatelessWidget {
  List<Store> brandData;
   TopBrand({Key? key,required this.brandData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: "Top Brands", color: AppColors.blackLight, size: 22,family: "OpenSans-Bold",),
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
         height: 180,
         child: ListView.builder(
           physics: const BouncingScrollPhysics(),
           scrollDirection: Axis.horizontal,
           shrinkWrap: true,
           itemBuilder: (context,index){
           return BrandWidget(data:brandData[index]);
         },itemCount: brandData.length,),
       )
      ],
    );
  }
}
