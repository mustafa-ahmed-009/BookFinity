import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_main_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewPhoneLayout extends StatelessWidget {
  const SearchViewPhoneLayout({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchViewCubit>(context).uiChanged();
    return const SearchViewMainLayout(crossAxisCount: 1);
  }
}
