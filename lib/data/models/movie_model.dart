import 'package:objectbox/objectbox.dart';

@Entity()
class MovieModel {
  @Id()
  late int? movieId;
  final int id;
  final String title;
  final String description;
  final String poster;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;

  MovieModel(
      {this.movieId,
      required this.id,
      required this.title,
      required this.description,
      required this.poster,
      required this.releaseDate,
      required this.voteAverage,
      required this.voteCount});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      description: json['overview'],
      poster: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': description,
      'poster_path': poster,
      'release_date': releaseDate,
      'vote_average': voteAverage,
      'vote_count': voteCount
    };
  }
}
