import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_moviedb/core/app_config.dart';
import 'package:test_moviedb/data/datasource/movie_local_datasource.dart';
import 'package:test_moviedb/data/datasource/movie_remote_datasource.dart';
import 'package:test_moviedb/data/repositories/movie_repository_impl.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';
import 'package:test_moviedb/domain/usecase/get_detail_movie_usecase.dart';
import 'package:test_moviedb/domain/usecase/get_movie_list_usecase.dart';
import 'package:test_moviedb/domain/usecase/get_search_movie_list_usecase.dart';
import 'package:test_moviedb/utils/api_helper.dart';

final locator = GetIt.instance;

void init() {
  // Api Service
  locator.registerLazySingleton(
      () => ApiHelper(Dio(BaseOptions(baseUrl: ConstantsApp.baseUrl))));

  //Repository
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
      movieRemoteDatasource: locator(), movieLocalDataSource: locator()));
  
  //DataSource
  locator.registerLazySingleton(() => MovieRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton(() => MovieLocalDataSourceImpl());
  
  //UseCase
  locator.registerLazySingleton(() => GetMovieListUseCase(locator()));
  locator.registerLazySingleton(() => GetDetailMovieUseCase(locator()));
  locator.registerLazySingleton(() => GetSearchMovieListUseCase(locator()));

  //Bloc
}
