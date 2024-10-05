import 'package:dartz/dartz.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';
import 'package:movie_list/domain/repository/movie_repository.dart';

class GetMovieListUseCase {
  final MovieRepository movieRepository;

  GetMovieListUseCase(this.movieRepository);

  Future<Either<Exception, List<MovieEntity>>> execute(int page) async {
    return await movieRepository.getListMovie(page: page);
  }
}
