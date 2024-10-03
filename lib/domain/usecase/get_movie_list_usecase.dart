import 'package:dartz/dartz.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';

class GetMovieListUseCase {
  final MovieRepository movieRepository;

  GetMovieListUseCase(this.movieRepository);

  Future<Either<Exception, List<MovieEntity>>> execute(int page) async {
    return await movieRepository.getListMovie(page: page);
  }
}
