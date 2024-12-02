import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data_layer/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data_layer/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data_layer/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      Dio(),
    ),
  );
  getIt.registerSingleton<HomeRepoImpl>
  (
    HomeRepoImpl(
      remoteDataSource: HomeRemoteDataSourceImpl(
        apiServices: getIt.get<ApiServices>(),
      ),
      homeLocalDataSource: HomeLocalDataSourceImpl()));
}
