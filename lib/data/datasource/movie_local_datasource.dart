import 'package:objectbox/objectbox.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:movie_list/objectbox.g.dart';

abstract class MovieLocalDatasource {
  Future<void> saveMovies(List<MovieModel> movies);

  Future<List<MovieModel>> getCachedMovieList();

  Future<MovieModel?> getDetailCachedMovie(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDatasource {
  final Box<MovieModel> movieBox;

  MovieLocalDataSourceImpl(this.movieBox);

  @override
  Future<MovieModel?> getDetailCachedMovie(int movieId) async {
    return movieBox.get(movieId);
  }

  @override
  Future<List<MovieModel>> getCachedMovieList() async {
    List<MovieModel> movie = movieBox.getAll();
    List<MovieModel> result = movie.toSet().toList();
    return result;
  }

  @override
  Future<void> saveMovies(List<MovieModel> movies) async {
    List<MovieModel> toSave = [];
    for (var movie in movies) {
      List<MovieModel> existingMovies = movieBox
          .query(MovieModel_.id.equals(movie.id))
          .build()
          .find();
      if (existingMovies.isEmpty) {
        toSave.add(movie);
      }
    }
    movieBox.putMany(toSave);
  }
}
