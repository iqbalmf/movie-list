import 'package:dartz/dartz.dart';
import 'package:movie_list/domain/entities/movie_detail_entity.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';

class GetDetailMovieUseCase {
  final MovieRepository movieRepository;

  GetDetailMovieUseCase(this.movieRepository);

  Future<Either<Exception, MovieDetailEntity>> execute({required int movieId}) async {
    return movieRepository.getDetailMovie(movieId);
  }
}
