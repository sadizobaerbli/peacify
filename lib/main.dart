import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:peacify/routes/app_routes.dart';
import 'package:peacify/routes/navigation_service.dart';
import 'package:provider/provider.dart';

import 'controllers/onboarding_provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  //=========Disabled landscape mode=========
  //-----------------------------------------

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  //==========contains the status and navigation bar settings=======
  //-----------------------------------------------------------------

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnboardingProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, child) {
        return const Peacify();
      },
    );
  }
}

class Peacify extends StatefulWidget {
  const Peacify({Key? key}) : super(key: key);

  @override
  State<Peacify> createState() => _PeacifyState();
}

class _PeacifyState extends State<Peacify> {
  @override
  Widget build(BuildContext context) {
    //=========initialization of go_router=============
    //-------------------------------------------------

    return MaterialApp.router(
      key: NavigationService.navigatorKey,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        //=========initialization of screen_util===========
        //-------------------------------------------------

        ScreenUtil.init(
          context,
          designSize: const Size(360, 690),
        );
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: widget!,
        );
      },
    );
  }
}
