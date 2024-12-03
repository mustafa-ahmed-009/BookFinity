import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:flutter/material.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    String realRating = "No Ratings Yet";
    if (!(book.rating == null)) {
      realRating = book.rating.toString();
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        SizedBox(
          width: 4,
        ),
        Text(realRating),
        SizedBox(
          width: 4,
        ),
        Text(book.ratingCount.toString()),
        SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
