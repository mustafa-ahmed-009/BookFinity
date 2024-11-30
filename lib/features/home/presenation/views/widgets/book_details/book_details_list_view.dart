import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_list_view_item.dart';
import 'package:flutter/material.dart';

class BookDetailsListView extends StatelessWidget {
  const BookDetailsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: SizedBox(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: (context, index) {
            return const SizedBox(
                child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: BookDetailsListViewItem(),
            ));
          }),
    ));
  }
}
