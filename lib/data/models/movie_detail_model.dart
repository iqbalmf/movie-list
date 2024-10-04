class MovieDetailModel {
  final int id;
  final String homepage;
  final String title;
  final String description;
  final double popularity;
  final String poster;
  final String imdbId;
  final List<Genres> genres;
  final double voteAverage;
  final int voteCount;
  final String status;
  final String releaseDate;
  final int budget;
  final int revenue;

  MovieDetailModel({
    required this.id,
    required this.homepage,
    required this.title,
    required this.description,
    required this.popularity,
    required this.imdbId,
    required this.poster,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
    required this.status,
    required this.releaseDate,
    required this.budget,
    required this.revenue,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      homepage: json['homepage'],
      title: json['title'],
      description: json['overview'],
      poster: json['poster_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
      imdbId: json['imdb_id'],
      popularity: json['popularity'],
      status: json['status'],
      genres: List<Genres>.from(json['genres'].map((g) => Genres.fromJson(g))),
      budget: json['budget'],
      revenue: json['revenue'],
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
      'vote_count': voteCount,
      'homepage': homepage,
      'genres': List<dynamic>.from(genres.map((g) => g.toJson())),
      'popularity': popularity,
      'imdb_id': imdbId,
      'status': status,
      'budget': budget,
      'revenue': revenue,
    };
  }
}

class Genres {
  final int id;
  final String name;

  Genres({required this.id, required this.name});

  factory Genres.fromJson(Map<String, dynamic> json) {
    return Genres(id: json['id'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
