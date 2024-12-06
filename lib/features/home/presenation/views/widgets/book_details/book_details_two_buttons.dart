import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/manager/cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class BookDetailsTwoButtons extends StatelessWidget {
  const BookDetailsTwoButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BookEntity book =
        BlocProvider.of<NewestBooksCubit>(context).bookEntity;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            onPressed: () async {
              final Uri url = Uri.parse(book.bookPreviewLink!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Text(
                book.bookPreviewLink == null || book.bookPreviewLink!.isEmpty
                    ? 'Sorry the book is not available for review'
                    : "click here to preview the book ",
                style: AppStyles.styleRegular20(context)
                    .copyWith(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
