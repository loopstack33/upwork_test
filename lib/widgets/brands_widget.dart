// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:upwork_test/models/brands_model.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/widgets/text_widget.dart';
import '../utils/imageConstants.dart';

class BrandWidget extends StatelessWidget {
  Store data;
   BrandWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(right: 10),
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: AppColors.white,
          border: Border.all(color: AppColors.borderColor,width: 1)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 84,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
                color: AppColors.lightBlue,
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: ClipRRect(
                  borderRadius:
                  BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl: data.logo.toString(),
                    imageBuilder:
                        (context, imageProvider) =>
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    placeholder: (context, url) =>
                        Image.asset(
                            loader),
                    errorWidget:
                        (context, url, error) =>
                    const Icon(
                      Icons.error,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(text: data.name.toString(), color: AppColors.blackLight, size: 16,family: "OpenSans-Bold"),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(Icons.star_rounded,color: AppColors.orangeDark,size: 20,),
                    const SizedBox(width: 5,),
                    TextWidget(text: double.parse(data.rating.toString()).toString(), color: AppColors.greyColor, size: 14,)
                  ],
                ),
                const SizedBox(height: 5),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Up to ${data.percentNow.toString()}%  ",
                        style:const TextStyle(color: AppColors.lightBlue2,fontWeight: FontWeight.w600,fontFamily: "OpenSans")
                      ),
                      TextSpan(
                          text:data.percentOld.toString()==""? "":"was ${data.percentOld.toString()} %",
                          style:const TextStyle(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontFamily: "OpenSans")

                      ),
                    ]
                  )
                ),
                const SizedBox(height: 10),
              ],
            ),
          )
        ],
      ),
    );
  }
}
