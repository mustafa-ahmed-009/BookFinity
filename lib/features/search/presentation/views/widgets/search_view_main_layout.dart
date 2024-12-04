import 'package:bookly/core/utils/app_styles.dart';
import 'package:bookly/features/home/domain_layer/entities/book_entity.dart';
import 'package:bookly/features/home/presenation/views/widgets/home_view/home_view_grid_view_builder.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_app_bar.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_grid_view_builder.dart';
import 'package:bookly/features/search/presentation/views/widgets/wrapping_in_the_middle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewMainLayout extends StatelessWidget {
  const SearchViewMainLayout({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          const SearchViewAppBar(),
          BlocBuilder<SearchViewCubit, SearchCubitState>(
            builder: (context, state) {
              if (state is SearchCubitInitial) {
                return WrappingInMiddleInsideCustomScrollViewWidget(
                  text: "Oops there are no data to show Please search First",
                );
              } else {
                return const SliverToBoxAdapter(
                  child: SizedBox(),
                );
              }
            },
          ),
          SearchViewGridBuilder(crossAxisCount: crossAxisCount)
        ],
      ),
    );
  }
}
