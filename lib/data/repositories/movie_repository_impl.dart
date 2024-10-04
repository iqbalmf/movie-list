import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_moviedb/core/error/failures.dart';
import 'package:test_moviedb/data/datasource/movie_local_datasource.dart';
import 'package:test_moviedb/data/datasource/movie_remote_datasource.dart';
import 'package:test_moviedb/data/mapper/MovieMapper.dart';
import 'package:test_moviedb/data/models/movie_detail_model.dart';
import 'package:test_moviedb/data/models/movie_model.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource movieRemoteDatasource;
  final MovieLocalDatasource movieLocalDataSource;

  MovieRepositoryImpl({required this.movieRemoteDatasource,
    required this.movieLocalDataSource});

  @override
  Future<Either<Exception, MovieDetailEntity>> getDetailMovie(
      int movieId) async {
    try {
      final result = await movieRemoteDatasource.getDetailMovies(movieId);
      MovieDetailModel movieDetailModel = MovieDetailModel.fromJson(result.data);
      final response = MovieMapper.movieDetailModelToEntity(movieDetailModel);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(message: e.response?.statusMessage ?? '',
          httpStatus: e.response?.statusCode ?? 0));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getListMovie(
      {String? query, int? page}) async {
    try {
      final data = await movieRemoteDatasource.getMovies(page ?? 1);
      List<MovieModel> movies = List<MovieModel>.from(
          data.data['results'].map((json) => MovieModel.fromJson(json)));
      final response = movies.map((item) =>
          MovieMapper.movieModelToEntity(item)).toList();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage ?? '',
          httpStatus: e.response?.statusCode ?? 0));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
