import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewGridBuilderItem extends StatelessWidget {
  const HomeViewGridBuilderItem({
    super.key,
    required this.book,
  });
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(
          color: kborderColor, // Purple border
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: GestureDetector(
        onTap: () {
          BlocProvider.of<NewestBooksCubit>(context).bookEntity = book;
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: SizedBox(
                  height: MediaQuery.sizeOf(context).height * .28,
                  child: HomeViewFeaturedListViewItem(
                    book: book,
                  )),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book.title.length > 50
                        ? "${book.title.substring(0, 50)}..."
                        : book.title,
                    style: AppStyles.styleSemiBold22(context),
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
                        style: AppStyles.styleSemiBold22(context),
                      ),
                      RatingRow(
                        book: book,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
