import 'package:equatable/equatable.dart';
import 'package:test_moviedb/domain/entities/genre_entity.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String homepage;
  final String title;
  final String description;
  final double popularity;
  final String poster;
  final String imdbId;
  final List<GenreEntity> genres;
  final double voteAverage;
  final int voteCount;
  final String status;
  final String releaseDate;
  final String linkHompage;

  MovieDetailEntity({
    required this.id,
    required this.homepage,
    required this.title,
    required this.description,
    required this.popularity,
    required this.poster,
    required this.imdbId,
    required this.genres,
    required this.voteCount,
    required this.voteAverage,
    required this.status,
    required this.releaseDate,
    required this.linkHompage,
  });

  @override
  List<Object?> get props => [
        id,
        homepage,
        title,
        description,
        popularity,
        poster,
        imdbId,
        genres,
        voteCount,
    voteAverage,
        status,
        releaseDate,
        linkHompage
      ];
}
