import 'package:dartz/dartz.dart';
import 'package:test_moviedb/data/datasource/movie_local_datasource.dart';
import 'package:test_moviedb/data/datasource/movie_remote_datasource.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource movieRemoteDatasource;
  final MovieLocalDatasource movieLocalDataSource;

  MovieRepositoryImpl(
      {required this.movieRemoteDatasource,
      required this.movieLocalDataSource});

  @override
  Future<Either<Exception, MovieDetailEntity>> getDetailMovie(int movieId) {
    // TODO: implement getDetailMovie
    throw UnimplementedError();
  }
  @override
  Future<Either<Exception, List<MovieEntity>>> getListMovie({String? query, required int page}) {
    // TODO: implement getListMovie
    throw UnimplementedError();
  }
}
