import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_list/core/error/failures.dart';
import 'package:movie_list/data/datasource/movie_local_datasource.dart';
import 'package:movie_list/data/datasource/movie_remote_datasource.dart';
import 'package:movie_list/data/mapper/MovieMapper.dart';
import 'package:movie_list/data/models/movie_detail_model.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:movie_list/domain/entities/movie_detail_entity.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';
import 'package:movie_list/utils/network_status.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieRemoteDatasource movieRemoteDatasource;
  final MovieLocalDatasource movieLocalDataSource;

  MovieRepositoryImpl(
      {required this.movieRemoteDatasource,
      required this.movieLocalDataSource});

  @override
  Future<Either<Exception, MovieDetailEntity>> getDetailMovie(
      int movieId) async {
    try {
      final result = await movieRemoteDatasource.getDetailMovies(movieId);
      MovieDetailModel movieDetailModel =
          MovieDetailModel.fromJson(result.data);
      final response = MovieMapper.movieDetailModelToEntity(movieDetailModel);
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(
          message: e.response?.statusMessage ?? '',
          httpStatus: e.response?.statusCode ?? 0));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Exception, List<MovieEntity>>> getListMovie(
      {String? query, int? page}) async {
    try {
      List<MovieModel> data;
      if (await NetworkStatus.isNetworkOnline()) {
        final result = await movieRemoteDatasource.getMovies(page ?? 1);
        data = List<MovieModel>.from(
            result.data['results'].map((json) => MovieModel.fromJson(json)));
        await movieLocalDataSource.saveMovies(data);
      } else {
        data = await movieLocalDataSource.getCachedMovieList();
      }
      final response =
          data.map((item) => MovieMapper.movieModelToEntity(item)).toList();
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
