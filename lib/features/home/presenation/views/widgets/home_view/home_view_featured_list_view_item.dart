import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class HomeViewFeaturedListViewItem extends StatelessWidget {
  const HomeViewFeaturedListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AspectRatio(
          aspectRatio: 2.5 / 3.5,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.fill,
              ))),
    );
  }
}
