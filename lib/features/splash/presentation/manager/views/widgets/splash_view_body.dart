import 'package:bookly/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();

    navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("assets/images/Logo.png"),
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }
}
