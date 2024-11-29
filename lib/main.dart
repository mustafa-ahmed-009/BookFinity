import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => const BooklyApp(), // Wrap your app
      ),
    );

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
    );
  }
}
