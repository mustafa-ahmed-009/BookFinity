import 'package:bookly/constants.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewAppBar extends StatefulWidget {
  const SearchViewAppBar({
    super.key,
  });

  @override
  State<SearchViewAppBar> createState() => _SearchViewAppBarState();
}

class _SearchViewAppBarState extends State<SearchViewAppBar> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final myCubit = BlocProvider.of<SearchViewCubit>(context);
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey, // Border color
              width: 1.5, // Border thickness
            ),
          ),
          child: Row(
            children: [
              // Search TextField
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      BlocProvider.of<SearchViewCubit>(context).emitInitial();
                    },
                    icon: const Icon(Icons.arrow_back)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (value) async {
                      final searchParam = _controller.value.text;
                      myCubit.mybooks = [];

                      await myCubit.fetchSearchResults(
                          searchParams: searchParam);
                      myCubit.searchParams = value;
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none, // Removes default border
                    ),
                  ),
                ),
              ),
              // Search Icon
              Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: IconButton(
                    onPressed: () async {
                      final searchParam = _controller.value.text;
                      myCubit.mybooks = [];
                      await myCubit.fetchSearchResults(
                          searchParams: searchParam);
                      myCubit.searchParams = _controller.value.text;
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey, // Icon color
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
