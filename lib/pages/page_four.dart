import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peacify/config/strings.dart';

import '../config/colors.dart';
import '../config/images.dart';
import '../config/text_styles.dart';

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 690.h, width: 360.w,
            child: Image.asset(
              Images.imageThree,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 28.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AllString.rememberText.toUpperCase(),
                  style: CustomTextStyle.mediumText(
                    24.sp,
                    color: CustomColors.white,
                  ),
                ),
                Text(
                  AllString.sunnySkyText.toUpperCase(),
                  style: CustomTextStyle.mediumText(
                    24.sp,
                    color: CustomColors.white,
                  ),
                ),
              ],
            ),),
        ],
      ),
    );
  }
}
