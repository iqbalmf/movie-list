import 'package:test_moviedb/data/models/movie_detail_model.dart';
import 'package:test_moviedb/data/models/movie_model.dart';
import 'package:test_moviedb/domain/entities/genre_entity.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

class MovieMapper {
  static MovieEntity movieModelToEntity(MovieModel movieModel) {
    return MovieEntity(
        id: movieModel.id,
        title: movieModel.title,
        description: movieModel.description,
        poster: movieModel.poster,
        releaseDate: movieModel.releaseDate,
        voteAverage: movieModel.voteAverage,
        voteCount: movieModel.voteCount);
  }

  static MovieDetailEntity movieDetailModelToEntity(
      MovieDetailModel movieDetailModel) {
    return MovieDetailEntity(
      id: movieDetailModel.id,
      homepage: movieDetailModel.homepage,
      title: movieDetailModel.title,
      description: movieDetailModel.description,
      popularity: movieDetailModel.popularity,
      poster: movieDetailModel.poster,
      imdbId: movieDetailModel.imdbId,
      genres: movieDetailModel.genres
          .map((item) => GenreEntity(id: item.id, name: item.name))
          .toList(),
      voteCount: movieDetailModel.voteCount,
      voteAverage: movieDetailModel.voteAverage,
      status: movieDetailModel.status,
      releaseDate: movieDetailModel.releaseDate,
      budget: movieDetailModel.budget,
      revenue: movieDetailModel.revenue,
    );
  }
}
