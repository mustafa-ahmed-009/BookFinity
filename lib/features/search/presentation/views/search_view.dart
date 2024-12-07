import 'package:bookly/core/functions/setup_service_locator.dart';
import 'package:bookly/features/search/data_layer/repos/search_repo.dart';
import 'package:bookly/features/search/domain_layer/use_cases/search_use_case.dart';
import 'package:bookly/features/search/presentation/cubits/cubit/search_cubit_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SearchViewCubit(
          searchUseCaseImp:
              SearchUseCaseImp(searchRepo: getIt.get<SearchRepoImpl>()),
        ),
        child: SearchViewBody(),
      ),
    );
  }
}
