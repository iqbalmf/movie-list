import 'package:dartz/dartz.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/domain/repository/movie_repository.dart';

class GetSearchMovieListUseCase {
  final MovieRepository movieRepository;

  GetSearchMovieListUseCase(this.movieRepository);

  Future<Either<Exception, List<MovieEntity>>> execute(String? query) async {
    return await movieRepository.getListMovie(query: query);
  }
}
