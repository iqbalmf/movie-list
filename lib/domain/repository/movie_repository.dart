import 'package:dartz/dartz.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Exception, List<MovieEntity>>> getListMovie(
      {String? query,required int page});

  Future<Either<Exception, MovieDetailEntity>> getDetailMovie(int movieId);
}
