import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeViewFeaturedListViewItem extends StatelessWidget {
  const HomeViewFeaturedListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AspectRatio(
        aspectRatio: 2.5 / 4,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFF542156),
              borderRadius: BorderRadius.circular(12),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/test_image.jpg"))),
        ),
      ),
    );
  }
}
