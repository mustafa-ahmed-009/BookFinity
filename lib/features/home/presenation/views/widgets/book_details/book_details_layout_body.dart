import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_list_view.dart';
import 'package:bookly/features/home/presenation/views/widgets/book_details/book_details_two_buttons.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_featured_list_view_item.dart';
import 'package:bookly/features/home/presenation/views/widgets/rating_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookDetailsLayoutBody extends StatelessWidget {
  const BookDetailsLayoutBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.43,
              child: const HomeViewFeaturedListViewItem(),
            ),
            Text(
              "The best book ever made  ",
              style: AppStyles.styleSemiBold28(context),
            ),
            Text(
              "Mustafa Ahmed ",
              style: AppStyles.styleMedium20(context),
            ),
            const RatingRow(),
            const SizedBox(
              height: 10,
            ),
            const BookDetailsTwoButtons(),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "you can also like this ",
                    style: AppStyles.styleMedium20(context),
                  ),
                )),
            const BookDetailsListView()
          ],
        ),
      ),
    );
  }
}
