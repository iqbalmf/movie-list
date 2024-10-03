import 'package:dartz/dartz.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';

class GetDetailMovieUseCase {
  final MovieRepository movieRepository;

  GetDetailMovieUseCase(this.movieRepository);

  Future<Either<Exception, MovieDetailEntity>> execute({required int movieId}) async {
    return movieRepository.getDetailMovie(movieId);
  }
}
