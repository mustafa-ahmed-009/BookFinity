import 'dart:developer';

import 'package:bookly/core/functions/show_error_snack_bar.dart';
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
      width: 300,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orangeAccent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onPressed: () async {
                final Uri _url = Uri.parse(book.bookPreviewLink!);
                if (await canLaunchUrl(_url)) {
                  await launchUrl(_url);
                }
              },
              child: Text(
              book.bookPreviewLink == null  || book.bookPreviewLink!.isEmpty  
                    ? 'sorry the book is not available for review'
                    : "click here to preview the book ",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
