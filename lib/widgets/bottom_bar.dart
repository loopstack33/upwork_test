import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:upwork_test/widgets/text_widget.dart';

import '../utils/app_colors.dart';
import '../utils/imageConstants.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.all(displayWidth * .05),
        height: displayWidth * .155,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.10),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
          borderRadius: BorderRadius.circular(14),
        ),
        child: ListView.builder(
          itemCount: 4,
          padding:const EdgeInsets.only(top: 10),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              setState(() {
                currentIndex = index;
                HapticFeedback.lightImpact();
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child:  AnimatedContainer(
              duration:const Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              width:  displayWidth * .23,
              alignment: Alignment.center,
              child: Column(

                children: [
                  Image.asset(listOfIcons2[index],height:22,
                    color: index == currentIndex
                        ? AppColors.lightBlue2
                        : AppColors.greyColor,),
                  const SizedBox(height: 5),
                  TextWidget(text: listOfStrings[index],
                    color: index == currentIndex
                        ? AppColors.lightBlue2
                        : AppColors.greyColor, size: 12,),
                ],
              ),
            ),
          ),
        ),
      ),
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
