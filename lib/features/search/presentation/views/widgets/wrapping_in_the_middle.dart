import 'package:bookly/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class WrappingInMiddleInsideCustomScrollViewWidget extends StatelessWidget {
  const WrappingInMiddleInsideCustomScrollViewWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
        child: Expanded(
      child: DefaultTextStyle(
        style: AppStyles.styleRegualr18(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
            ),
          ],
        ),
      ),
    ));
  }
}
