import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:go_router/go_router.dart';
import 'package:peacify/config/strings.dart';
import 'package:peacify/config/text_styles.dart';
import 'package:provider/provider.dart';
import '../controllers/onboarding_provider.dart';
import 'colors.dart';

class BreathingFunctions{

  static Column getView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Provider.of<OnboardingProvider>(context)
              .getBreathState
              .toString()
              .toUpperCase(),
          style: CustomTextStyle.mediumText(
            18.sp,
            color: CustomColors.white,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.r),
                  bottomLeft: Radius.circular(5.r),
                ),
                child: RotatedBox(
                  quarterTurns: 2,
                  child: LinearProgressIndicator(
                    backgroundColor: CustomColors.white,
                    value: Provider.of<OnboardingProvider>(context)
                        .getProgressValue,
                    minHeight: 7.h,
                    color: CustomColors.yellow,
                  ),
                ),
              ),
            ),
            Container(
              height: 7.h,
              width: 20.w,
              color: CustomColors.yellow,
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5.r),
                  bottomRight: Radius.circular(5.r),
                ),
                child: LinearProgressIndicator(
                  backgroundColor: CustomColors.white,
                  value:
                  Provider.of<OnboardingProvider>(context).getProgressValue,
                  minHeight: 7.h,
                  color: CustomColors.yellow,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            '${Provider.of<OnboardingProvider>(context).getBreathCounter} ${AllString.breathLeft}'
                .toUpperCase(),
            style: CustomTextStyle.mediumText(14.sp, color: CustomColors.white),
          ),
        ),
      ],
    );
  }

  static void breathIn(BuildContext context) async {
    for (var i = 0; i < 101; i++) {
      if (i == 100) {
        await Future.delayed(const Duration(seconds: 1), () {
          Provider.of<OnboardingProvider>(context, listen: false)
              .setBreathState(BreathState.HOLD);
        });
        Future.delayed(const Duration(seconds: 3), () {
          Provider.of<OnboardingProvider>(context, listen: false)
              .setBreathState(BreathState.BREATH_OUT);
          breathOut(context);
        });
      }
      await Future.delayed(const Duration(milliseconds: 40), () async {
        Provider.of<OnboardingProvider>(context, listen: false)
            .setProgressValue(
            Provider.of<OnboardingProvider>(context, listen: false)
                .breathState);

        if (await Vibrate.canVibrate) {
          Vibrate.vibrate();
        }
      });
    }
  }

  static void breathOut(BuildContext context) async {
    for (var i = 0; i < 101; i++) {
      if (i == 100) {
        await Future.delayed(const Duration(seconds: 1), () {
          Provider.of<OnboardingProvider>(context, listen: false)
              .setBreathState(BreathState.HOLD);
          Provider.of<OnboardingProvider>(context, listen: false)
              .setBreathCounter();

          Provider.of<OnboardingProvider>(context, listen: false)
              .setBreathState(BreathState.HOLD);
          Future.delayed(const Duration(seconds: 3), () {
            if (Provider.of<OnboardingProvider>(context, listen: false)
                .getBreathCounter ==
                0) {
              context.go('/pageFour');
            } else if (Provider.of<OnboardingProvider>(context, listen: false)
                .getBreathCounter ==
                1) {
              context.go('/pageThree');
            } else if (Provider.of<OnboardingProvider>(context, listen: false)
                .getBreathCounter ==
                2) {
              context.go('/pageTwo');
            }

          });

          /*else {
            Future.delayed(const Duration(seconds: 3), () {
              Provider.of<OnboardingProvider>(context, listen: false)
                  .setBreathState(BreathState.BREATH_IN);
            });
          }*/
        });
      }
      await Future.delayed(const Duration(milliseconds: 40), () async {
        Provider.of<OnboardingProvider>(context, listen: false)
            .setProgressValue(
            Provider.of<OnboardingProvider>(context, listen: false)
                .breathState);

        if (await Vibrate.canVibrate) {
          Vibrate.vibrate();
        }
      });
    }
  }
}