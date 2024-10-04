import 'package:test_moviedb/data/models/movie_model.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity movieModelToEntity(MovieModel movieModel){
    return MovieEntity(
        id: movieModel.id,
        title: movieModel.title,
        description: movieModel.description,
        poster: movieModel.poster,
        releaseDate: movieModel.releaseDate,
        voteAverage: movieModel.voteAverage,
        voteCount: movieModel.voteCount);
  }
}