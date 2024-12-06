import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.searchIconSize, required this.logoHeight});
  final double searchIconSize;
  final double logoHeight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            kLogoImage,
            height: logoHeight,
          ),
          IconButton(
              color: kborderColor,
              onPressed: () {
                GoRouter.of(context).push(AppRouter.kSearchView);
              },
              icon: Icon(
                Icons.search,
                size: searchIconSize,
              ))
        ],
      ),
    );
  }
}
