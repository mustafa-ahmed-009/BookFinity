import 'package:bookly/core/adaptive_layout.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_desktop_layout.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_phone_layout.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_tablet_layout.dart';
import 'package:flutter/cupertino.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
        mobileLayout: (context) => BookDetailsPhoneLayout(),
        tableLayout: (context) => BookDetailsTabletLayout(),
        desktopLayout: (context) => BookDetailsDesktopLayout());
  }
}
