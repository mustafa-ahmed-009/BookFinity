import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_builder_item.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_grid_view_builder.dart';
import 'package:flutter/material.dart';

class SearchVIewGridViewBuilder extends StatelessWidget {
  const SearchVIewGridViewBuilder({
    super.key,
    required this.books,
    required this.widget,
  });

  final List<BookEntity> books;
  final SearchViewGridBuilder widget;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
        itemCount: books.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.crossAxisCount,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2,
        ),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 9),
            child: SearchViewGridBuilderItem(
              book: books[index],
            ),
          );
        });
  }
}
