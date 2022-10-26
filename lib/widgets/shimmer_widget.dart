// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:upwork_test/utils/imageConstants.dart';
import 'package:upwork_test/widgets/text_widget.dart';
import '../components/recent_visits.dart';
import '../utils/app_colors.dart';

class ShimmerWidget extends StatelessWidget {
   ShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding:const EdgeInsets.only(left: 20, right: 20,bottom:10,top: 20),
            child: Column(
              children: [
                Column(
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
                          return Container(
                            margin:const EdgeInsets.only(right: 10),
                            width: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),

                                border: Border.all(color: AppColors.borderColor,width: 1)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 84,
                                  decoration:  BoxDecoration(
                                    borderRadius:const BorderRadius.only(topLeft: Radius.circular(14),topRight: Radius.circular(14)),
                                      border: Border.all(color: AppColors.borderColor,width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Center(
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        child: Image.asset(
                                            google,height: 40,),
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
                                      TextWidget(text: "Google", color: AppColors.blackLight, size: 16,family: "OpenSans-Bold"),
                                      const SizedBox(height: 5),
                                      Row(
                                        children: [
                                          const Icon(Icons.star_rounded,color: AppColors.orangeDark,size: 20,),
                                          const SizedBox(width: 5,),
                                          TextWidget(text: "4.6", color: AppColors.greyColor, size: 14,)
                                        ],
                                      ),
                                      const SizedBox(height: 5),
                                      const Text.rich(
                                          TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "Up to 5%  ",
                                                    style: TextStyle(color: AppColors.lightBlue2,fontWeight: FontWeight.w600,fontFamily: "OpenSans")
                                                ),
                                                TextSpan(
                                                    text:"was 3 %",
                                                    style: TextStyle(color: AppColors.greyColor,fontWeight: FontWeight.w400,fontFamily: "OpenSans")

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
                        },itemCount: 5,),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Column(
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
                          return  Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(15),
                                margin:const EdgeInsets.only(right: 10),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: AppColors.white),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(10),
                                  child: Image.asset(footwear),
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                  width: 65,
                                  child: TextWidget(text: "Footwear", color: AppColors.blackLight, size: 12))
                            ],
                          );
                        },itemCount: 5,),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                const RecentVisits(),
                const SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.white),
                      borderRadius: BorderRadius.circular(14)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Image.asset(p1,height: 48,),
                            Positioned(
                              left: 28,
                              bottom: 6,
                              child: Image.asset(p2,height: 39,),)
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(text: "Invite your friends!", color: AppColors.blackLight, size: 16,fontWeight: FontWeight.w600,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.4,
                                child: TextWidget(text: "To earn extra cashback when they spend at Redim merchant locations", color: AppColors.greyDark, size: 12,fontWeight: FontWeight.w400,))

                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          margin:const EdgeInsets.only(right: 10),
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.white),
                          ),
                          child: const Center(
                            child: Icon(Icons.arrow_forward_rounded,color: AppColors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),

      ],
    );
  }

  List<String> listOfIcons2 = [
    home,
    shops,
    portfolio,
    menu,
  ];

  List<String> listOfStrings = [
    'Home',
    'All Shops',
    'Portfolio',
    'Menu',
  ];
}
