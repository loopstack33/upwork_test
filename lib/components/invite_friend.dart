import 'package:flutter/material.dart';
import 'package:upwork_test/utils/app_colors.dart';
import 'package:upwork_test/utils/imageConstants.dart';
import 'package:upwork_test/widgets/text_widget.dart';

class InviteFriend extends StatelessWidget {
  const InviteFriend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
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
                color: AppColors.lightBlue2,
              ),
              child: const Center(
                child: Icon(Icons.arrow_forward_rounded,color: AppColors.white,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
