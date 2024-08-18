import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;



void serverLocatedSetup() {
  // Register ApiService first
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

  // Now you can register HomeRepoImpl, which depends on ApiService
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    homeRemoteDataSource: HomeRemoteSourceImpl(apiService: getIt.get<ApiService>()),
    homeLocalDataSource: HomeLocalDataSourceImpl(),
  ));
}


