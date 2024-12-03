import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewGridBuilderItem extends StatelessWidget {
  const HomeViewGridBuilderItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView);
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: SizedBox(
                height: MediaQuery.sizeOf(context).height * .25,
                child: HomeViewFeaturedListViewItem(
                  imageUrl: book.image ??
                      "https://ih1.redbubble.net/image.4905811447.8675/flat,750x,075,f-pad,750x1000,f8f8f8.jpg",
                )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title.length > 45
                      ? book.title.substring(0, 45) + "..."
                      : book.title,
                  style: AppStyles.styleSemiBold24(context),
                ),
                const Spacer(),
                Text(
                  book.authorName ?? "book author name was not found ",
                  style: AppStyles.sytleLight20(context),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Free",
                      style: AppStyles.styleSemiBold24(context),
                    ),
                    const RatingRow(),
                  ],
                ),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
