class MovieDetailModel {
  final int id;
  final String homepage;
  final String title;
  final String description;
  final double popularity;
  final String poster;
  final String imdbId;
  final List<Genres> genres;
  final double voteAverate;
  final int voteCount;
  final String status;
  final String releaseDate;
  final String linkHompage;

  MovieDetailModel({
    required this.id,
    required this.homepage,
    required this.title,
    required this.description,
    required this.popularity,
    required this.imdbId,
    required this.poster,
    required this.genres,
    required this.voteAverate,
    required this.voteCount,
    required this.status,
    required this.releaseDate,
    required this.linkHompage,
  });
}

class Genres {
  final int id;
  final String name;

  Genres({required this.id, required this.name});
}
