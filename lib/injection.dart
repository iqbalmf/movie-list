import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:movie_list/core/app_config.dart';
import 'package:movie_list/data/datasource/movie_local_datasource.dart';
import 'package:movie_list/data/datasource/movie_remote_datasource.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:movie_list/data/repositories/movie_repository_impl.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';
import 'package:movie_list/domain/usecase/get_detail_movie_usecase.dart';
import 'package:movie_list/domain/usecase/get_movie_list_usecase.dart';
import 'package:movie_list/domain/usecase/get_search_movie_list_usecase.dart';
import 'package:movie_list/objectbox.g.dart';
import 'package:movie_list/utils/api_helper.dart';
import 'package:movie_list/view/detailpage/bloc/detail_bloc.dart';
import 'package:movie_list/view/homepage/bloc/home_bloc.dart';

final locator = GetIt.instance;

Future<void> init() async {
  // Api Service
  locator.registerLazySingleton(
      () => ApiHelper(Dio(BaseOptions(baseUrl: ConstantsApp.baseUrl))));

  //Object Box
  final dir = await getApplicationDocumentsDirectory();
  final store = Store(getObjectBoxModel(), directory: '${dir.path}/objectbox');
  locator.registerLazySingleton(() => store);
  locator.registerLazySingleton(() => store.box<MovieModel>());

  //Repository
  locator.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(
      movieRemoteDatasource: locator(), movieLocalDataSource: locator()));
  
  //DataSource
  locator.registerLazySingleton<MovieRemoteDatasource>(() => MovieRemoteDataSourceImpl(locator()));
  locator.registerLazySingleton<MovieLocalDatasource>(() => MovieLocalDataSourceImpl(store.box<MovieModel>()));
  
  //UseCase
  locator.registerLazySingleton(() => GetMovieListUseCase(locator()));
  locator.registerLazySingleton(() => GetDetailMovieUseCase(locator()));
  locator.registerLazySingleton(() => GetSearchMovieListUseCase(locator()));

  //Bloc
  locator.registerFactory(() => HomeBloc(locator()));
  locator.registerFactory(() => DetailBloc(locator()));
}
