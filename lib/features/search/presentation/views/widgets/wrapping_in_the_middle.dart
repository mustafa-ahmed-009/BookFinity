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
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
        ),
      ],
    ));
  }
}
