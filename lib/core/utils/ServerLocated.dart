import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_feature_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
final getIt = GetIt.instance;

class Serverlocated {

  void setup() {
    getIt.registerSingleton<HomeRepo>(HomeRepoImpl(
        homeRemoteDataSource:
            HomeRemoteSourceImpl(apiService: getIt.get<ApiService>()),
        homeLocalDataSource: HomeLocalDataSourceImpl()));
    getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  }
}
