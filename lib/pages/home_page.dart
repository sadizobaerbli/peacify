import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:peacify/config/button_names.dart';
import 'package:peacify/config/strings.dart';
import '../config/colors.dart';
import '../config/images.dart';
import '../config/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  // controller
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 690.h,
            width: 360.w,
            child: Image.asset(
              Images.imageFour,
              fit: BoxFit.fill,
            ),
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final Size biggest = constraints.biggest;
              return Stack(
                children: <Widget>[
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          Rect.fromLTWH(100.w, 290.h, 220.w, 34.h),
                          biggest),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(100.w, -200.h, 220.w, 34.h),
                          biggest),
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeIn,
                    )),
                    child:  Text(
                      AllString.welcomeText,
                      style: CustomTextStyle.boldText(
                        15.sp,
                        color: CustomColors.black,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final Size biggest = constraints.biggest;
              return Stack(
                children: <Widget>[
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          Rect.fromLTWH(70.w, 320.h, 220.w, 80.h),
                          biggest),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(70.w, -200.h, 220.w, 80.h),
                          biggest),
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeIn,
                    )),
                    child: SizedBox(
                      width: 220.w,
                      child: Text(
                        AllString.secondText,
                        textAlign: TextAlign.center,
                        style: CustomTextStyle.extraBoldText(
                          19.sp,
                          color: CustomColors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final Size biggest = constraints.biggest;
              return Stack(
                children: <Widget>[
                  PositionedTransition(
                    rect: RelativeRectTween(
                      begin: RelativeRect.fromSize(
                          Rect.fromLTWH(120.w, 400.h, 100.w, 34.h),
                          biggest),
                      end: RelativeRect.fromSize(
                          Rect.fromLTWH(120.w, 1000.h, 100.w, 34.h),
                          biggest),
                    ).animate(CurvedAnimation(
                      parent: _controller,
                      curve: Curves.easeIn,
                    )),
                    child: InkWell(
                      onTap: (){
                        _controller.forward();
                        Future.delayed(const Duration(milliseconds: 1500), () {
                          context.go('/pageOne');
                        });
                      },
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.r),
                          color: CustomColors.leafGreen,
                        ),
                        child: Center(
                          child: Text(
                            ButtonNames.begin,
                            style: CustomTextStyle.semiBoldText(
                              16.sp,
                              color: CustomColors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
