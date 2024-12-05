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
        const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          realRating,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(realRating == "No Ratings Yet"
            ? ""
            : "(${book.ratingCount.toString()})"),
        const SizedBox(
          width: 4,
        ),
      ],
    );
  }
}
