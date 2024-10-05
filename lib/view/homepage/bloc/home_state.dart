import 'package:equatable/equatable.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';

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
  int currentPage;

  HomeState({
    this.message,
    this.movieStatusState,
    this.movies = const <MovieEntity>[],
    this.currentPage = 1,
  });

  HomeState copyWith({
    String? message,
    MovieStatusState? movieStatusState,
    List<MovieEntity>? movies,
    int? currentPage,
    bool? statusNetwork,
  }) =>
      HomeState(
        message: message,
        movieStatusState: movieStatusState,
        movies: movies ?? this.movies,
        currentPage: currentPage ?? this.currentPage,
      );

  @override
  List<Object?> get props =>
      [message, movieStatusState, movies, currentPage,];
}
