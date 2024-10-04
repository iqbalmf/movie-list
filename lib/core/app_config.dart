enum EnvirontmentApp { Dev, Production }

class ConstantsApp {
  static late Map<dynamic, dynamic> _config;
  static const String getMovies = "/discover/movie";
  static const String getMovieId = "/movie/";
  static const String searchMovie = "/search/movie";
  static const String contentType = "application/json";

  static void setEnvironment(EnvirontmentApp env) {
    switch (env) {
      case EnvirontmentApp.Production:
        _config = _Config.production;
        break;
      default:
        _config = _Config.development;
    }
  }

  static get baseUrl {
    return _config[_Config.baseUrl];
  }

  static get imageUrl {
    return _config[_Config.imageUrl];
  }

  static get imdbUrl {
    return _config[_Config.imdbUrl];
  }

  static get modeDevelopment {
    return _config[_Config.modeDevelopment];
  }

  static get appName {
    return _config[_Config.appName];
  }

  static get versionApp {
    return _config[_Config.versionApp];
  }

  static get apiKey {
    return _config[_Config.xApiKey];
  }
}

class _Config {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imageUrl = "https://image.tmdb.org/t/p/w500";
  static const String imdbUrl = "https://www.imdb.com/title/";
  static const String appName = "";
  static const bool modeDevelopment = false;
  static const String versionApp = "1.0.0";
  static const String xApiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWM0NmViZDBjYWYyNTU5MzFjYzA1OWI0NDJhZjZjOCIsIm5iZiI6MTcyNzkyNjk3My45MTYwNjIsInN1YiI6IjU4M2E5ZGFjYzNhMzY4NDNlZjAwZmMxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJNaaNLB1mBwSkdTi_qqAaLfMidWuJXRIbpe0Jdqpos';
  static Map<dynamic, dynamic> development = {
    baseUrl: 'https://api.themoviedb.org/3',
    imageUrl: 'https://image.tmdb.org/t/p/w500',
    imdbUrl: "https://www.imdb.com/title/",
    appName: 'Movie List Dev',
    modeDevelopment: true,
    versionApp: "1.0.0",
    xApiKey: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWM0NmViZDBjYWYyNTU5MzFjYzA1OWI0NDJhZjZjOCIsIm5iZiI6MTcyNzkyNjk3My45MTYwNjIsInN1YiI6IjU4M2E5ZGFjYzNhMzY4NDNlZjAwZmMxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJNaaNLB1mBwSkdTi_qqAaLfMidWuJXRIbpe0Jdqpos',
  };

  static Map<dynamic, dynamic> production = {
    baseUrl: 'https://api.themoviedb.org/3',
    imageUrl: 'https://image.tmdb.org/t/p/w500',
    imdbUrl: "https://www.imdb.com/title/",
    appName: 'Movie List',
    modeDevelopment: false,
    versionApp: "1.0.0",
    xApiKey: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOWM0NmViZDBjYWYyNTU5MzFjYzA1OWI0NDJhZjZjOCIsIm5iZiI6MTcyNzkyNjk3My45MTYwNjIsInN1YiI6IjU4M2E5ZGFjYzNhMzY4NDNlZjAwZmMxNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.lJNaaNLB1mBwSkdTi_qqAaLfMidWuJXRIbpe0Jdqpos',
  };
}
