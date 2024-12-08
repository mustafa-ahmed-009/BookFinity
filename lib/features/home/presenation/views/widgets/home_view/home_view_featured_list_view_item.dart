import 'package:bookly/constants.dart';
import 'package:bookly/core/app_router.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeViewFeaturedListViewItem extends StatelessWidget {
  const HomeViewFeaturedListViewItem({super.key, required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    final String validUrl = book.image!.isNotEmpty
        ? book.image!
        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQppJKxBxJI-9UWLe2VVmzuBd24zsq4_ihxZw&s";
    return Container(
      margin: const EdgeInsets.only(right: 8), // Spacing between items
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E), // Card background
        border: Border.all(
          color: kborderColor, // Purple border
        ),
        borderRadius: BorderRadius.circular(12),
      ),

      child: GestureDetector(
        onTap: () {
          BlocProvider.of<NewestBooksCubit>(context).bookEntity = book;

          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: AspectRatio(
            aspectRatio: 2.5 / 3.5,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: validUrl,
                  fit: BoxFit.fill,
                ))),
      ),
    );
  }
}
