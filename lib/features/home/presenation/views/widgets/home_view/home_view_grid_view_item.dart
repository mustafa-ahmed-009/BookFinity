import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeViewGridBuilderItem extends StatelessWidget {
  const HomeViewGridBuilderItem({
    super.key,
  });

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
                child: const HomeViewFeaturedListViewItem()),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Fanzhendong vs Truls Morgarid paris olympics finals",
                  style: AppStyles.styleSemiBold24(context),
                ),
                Spacer(),
                Text(
                  "BookAuthor",
                  style: AppStyles.sytleLight20(context),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r"19.99$",
                      style: AppStyles.styleSemiBold24(context),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text("4.8"),
                        SizedBox(
                          width: 4,
                        ),
                        Text("(231)"),
                        SizedBox(
                          width: 4,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
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
