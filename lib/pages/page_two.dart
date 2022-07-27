import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:peacify/config/images.dart';
import 'package:peacify/config/strings.dart';
import 'package:peacify/config/text_styles.dart';
import '../config/colors.dart';
import '../config/stateful_wrapper.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () {
        Future.delayed(const Duration(seconds: 4), () {
          context.go('/pageThree');
        });
      },
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
              height: 690.h,
              width: 360.w,
              child: Image.asset(
                Images.imageTwo,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 80.h,
              left: 26.w,
              right: 26.w,
              child: Text(
                AllString.threeBreathText.toUpperCase(),
                textAlign: TextAlign.center,
                style: CustomTextStyle.mediumText(
                  18.sp,
                  color: CustomColors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
