import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvironmentApp {
  dev,
  prod;

  bool get isProduction => this == EnvironmentApp.prod;
  bool get isDevelopment => this == EnvironmentApp.dev;
}

class ConstantsApp {
  static const String getMovies = "/discover/movie";
  static const String getMovieId = "/movie/";
  static const String searchMovie = "/search/movie";
  static const String contentType = "application/json";
  static String baseUrl = dotenv.env["BASE_URL"] ?? '';
  static String imageUrl = dotenv.env['IMAGE_URL'] ?? '';
  static String imdbUrl = dotenv.env['IMDB_URL'] ?? '';
  static String apiKey = dotenv.env['API_KEY'] ?? '';
}
