import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class HomeViewFeaturedListViewItem extends StatelessWidget {
  const HomeViewFeaturedListViewItem({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final String validUrl = imageUrl.isNotEmpty
        ? imageUrl
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQppJKxBxJI-9UWLe2VVmzuBd24zsq4_ihxZw&s"; // Fallback image URL

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: AspectRatio(
          aspectRatio: 2.5 / 3.5,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: validUrl,
                fit: BoxFit.fill,
              ))),
    );
  }
}
