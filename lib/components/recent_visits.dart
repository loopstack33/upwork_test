import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/text_widget.dart';

class RecentVisits extends StatelessWidget {
  const RecentVisits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(text: "Recently Visited", color: AppColors.blackLight, size: 22,family: "OpenSans-Bold",),
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
        TextWidget(text: "Shop on your interested store just viewed!", color: AppColors.greyColor, fontWeight: FontWeight.w400, size: 16),

      ],
    );
  }
}
