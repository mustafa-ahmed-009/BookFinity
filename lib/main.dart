import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const BooklyApp(), // Wrap your app
    ),
  );
  await Hive.initFlutter(); 
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(kHiveFeaturebBox);
   await Hive.openBox(kHiveNewsetBox);
}

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
