import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peacify/config/breathing_functions.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../config/images.dart';
import '../config/stateful_wrapper.dart';
import '../controllers/onboarding_provider.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  VideoPlayerController? _videoPlayerController;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Provider.of<OnboardingProvider>(context, listen: false)
          .setBreathState(BreathState.BREATH_IN);
      BreathingFunctions.breathIn(context);
    });
    _videoPlayerController = VideoPlayerController.asset(
      Images.videoTwo,
    )
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _videoPlayerController!.play();
    _videoPlayerController!.setLooping(true);
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
            left: 26.w,
            right: 26.w,
            child: BreathingFunctions.getView(context),
          ),
        ],
      ),
    );
  }
}
