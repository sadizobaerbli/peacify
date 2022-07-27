import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:peacify/config/text_styles.dart';
import 'package:peacify/pages/home_page.dart';
import 'package:peacify/pages/splash_page.dart';
import 'package:peacify/routes/route_names.dart';
import '../pages/page_one.dart';
import '../pages/page_four.dart';
import '../pages/page_two.dart';
import '../pages/page_three.dart';

final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        name: RouteNames.splashPage,
        path: '/',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const SplashPage(),
          );
        },
      ),
      GoRoute(
        name: RouteNames.homePage,
        path: '/homePage',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const HomePage(),
          );
        },
      ),
      GoRoute(
        path: '/pageOne',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PageOne(),
          transitionsBuilder: (context, animation, secondaryAnimation, child){
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }
        ),
      ),
      GoRoute(
        path: '/pageTwo',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PageTwo(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/pageThree',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PageThree(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
      GoRoute(
        path: '/pageFour',
        pageBuilder: (context, state) => CustomTransitionPage<void>(
          key: state.pageKey,
          child: const PageFour(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              FadeTransition(opacity: animation, child: child),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          body: Center(
            child: Text(
              state.error.toString(),
              textAlign: TextAlign.center,
              style: CustomTextStyle.mediumText(12),
            ),
          ),
        ),
      );
    });
