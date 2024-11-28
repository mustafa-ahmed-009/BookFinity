import 'package:bookly/core/adaptive_layout.dart';
import 'package:bookly/features/home/presenation/views/home_view_desktop_layout.dart';
import 'package:bookly/features/home/presenation/views/home_view_mobile_layout.dart';
import 'package:bookly/features/home/presenation/views/home_view_tablet_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AdaptiveLayout(
          mobileLayout: (context) => const HomeViewMobileLayout(),
          tableLayout: (context) => const HomeViewTabletLayout(),
          desktopLayout: (context) => const HomeViewDesktopLayout()),
    );
  }
}
