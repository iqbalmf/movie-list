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
    List<MovieModel> result = [];
    for(MovieModel mov in movie){
      if(result.contains(mov)){} else {
        result.add(mov);
      }
    }
    return result;
  }

  @override
  Future<void> saveMovies(List<MovieModel> movies) async {
    List<MovieModel> toSave = [];
    for (var movie in movies) {
      final existingMovies = movieBox
          .query(MovieModel_.movieId.equals(movie.movieId ?? 0))
          .build()
          .find();
      if (existingMovies.isEmpty) {
        toSave.add(movie);
      }
    }
    movieBox.putMany(toSave);
  }
}
