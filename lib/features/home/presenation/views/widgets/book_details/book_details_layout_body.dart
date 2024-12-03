import 'package:bookly/core/app_router.dart';
import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_two_buttons.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BookDetailsLayoutBody extends StatelessWidget {
  const BookDetailsLayoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookEntity book =
        BlocProvider.of<NewestBooksCubit>(context).bookEntity;

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).pop(AppRouter.kHomeView);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.43,
                  child: HomeViewFeaturedListViewItem(
                    imageUrl: book.image!,
                  ),
                ),
                Text(
                  book.title,
                  style: AppStyles.styleSemiBold28(context),
                ),
                Text(
                  book.authorName!,
                  style: AppStyles.styleMedium20(context),
                ),
                RatingRow(book: book),
                const SizedBox(
                  height: 10,
                ),
                const BookDetailsTwoButtons(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
