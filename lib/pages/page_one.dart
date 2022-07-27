import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:peacify/config/strings.dart';
import 'package:video_player/video_player.dart';
import '../config/colors.dart';
import '../config/images.dart';
import '../config/text_styles.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin{
  VideoPlayerController? _videoPlayerController;


  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..forward();

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
        Images.videoOne)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _videoPlayerController!.play();
  }

  @override
  didChangeDependencies(){
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 4), (){
      context.go('/pageTwo');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: FittedBox(
              // If your background video doesn't look right, try changing the BoxFit property.
              // BoxFit.fill created the look I was going for.
              fit: BoxFit.fill,
              child: SizedBox(
                width: _videoPlayerController!.value.size.width,
                height: _videoPlayerController!.value.size.height,
                child: VideoPlayer(_videoPlayerController!),
              ),
            ),
          ),
          Positioned(
            bottom: 80.h,
            left: 30.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 260.w,
                  child: FadeTransition(
                    opacity: _animation,
                    child: Text(
                      AllString.thirdText.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: CustomTextStyle.semiBoldText(
                        17.sp,
                        color: CustomColors.lightGreen,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 12.h),
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    AllString.fourthText.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: CustomTextStyle.boldText(
                      17.sp,
                      color: CustomColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
