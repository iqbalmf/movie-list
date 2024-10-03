import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  int id;
  String title;
  String description;
  String poster;
  String releaseDate;
  double voteAverage;
  int voteCount;

  MovieEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.poster,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});

  @override
  List<Object?> get props =>
      [id, title, description, poster, releaseDate, voteAverage, voteCount];
}
