import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_item.dart';
import 'package:flutter/cupertino.dart';

class HomeViewGridView extends StatelessWidget {
  const HomeViewGridView({super.key, required this.crossAxisCount});
  final int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 5,
          mainAxisSpacing: 4,
          mainAxisExtent: MediaQuery.sizeOf(context).height * 0.2, // height
        ),
        itemBuilder: (context, index) {
          return const HomeViewGridBuilderItem();
        });
  }
}
