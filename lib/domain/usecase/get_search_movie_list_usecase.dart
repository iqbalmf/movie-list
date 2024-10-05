import 'package:dartz/dartz.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';

class GetSearchMovieListUseCase {
  final MovieRepository movieRepository;

  GetSearchMovieListUseCase(this.movieRepository);

  Future<Either<Exception, List<MovieEntity>>> execute(String? query) async {
    return await movieRepository.getListMovie(query: query);
  }
}
