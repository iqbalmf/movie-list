import 'package:equatable/equatable.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

enum MovieStatusState {
  init,
  loading,
  done,
  fail,
}

class HomeState extends Equatable {
  String? message;
  MovieStatusState? movieStatusState;
  List<MovieEntity> movies;

  HomeState(
      {this.message,
      this.movieStatusState,
      this.movies = const <MovieEntity>[]});

  HomeState copyWith(
          {String? message,
          MovieStatusState? movieStatusState,
          List<MovieEntity>? movies}) =>
      HomeState(
          message: message,
          movieStatusState: movieStatusState,
          movies: movies ?? this.movies);

  @override
  List<Object?> get props => [message, movieStatusState, movies];
}
