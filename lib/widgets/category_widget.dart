// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/utils/color_converter.dart';
import 'package:upwork_test/widgets/text_widget.dart';
import '../models/categories_model.dart';
import '../utils/imageConstants.dart';

class CategoryWidget extends StatelessWidget {
   Category data;
   CategoryWidget({Key? key,required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          margin:const EdgeInsets.only(right: 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: data.color.toColor(),
          ),
          child: ClipRRect(
            borderRadius:
            BorderRadius.circular(10),
            child: SvgPicture.network(
              data.icon.toString(),
              semanticsLabel: 'svg',
              placeholderBuilder: (BuildContext context) => Image.asset(
                  loader),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
            width: 65,
            child: TextWidget(text: data.name.toString(), color: AppColors.blackLight, size: 12))
      ],
    );
  }
}
