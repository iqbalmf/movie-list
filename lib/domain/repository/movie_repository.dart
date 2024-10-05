import 'package:dartz/dartz.dart';
import 'package:movie_list/domain/entities/movie_detail_entity.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<Either<Exception, List<MovieEntity>>> getListMovie(
      {String? query,int? page});

  Future<Either<Exception, MovieDetailEntity>> getDetailMovie(int movieId);
}
