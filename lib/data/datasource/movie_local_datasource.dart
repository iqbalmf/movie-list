abstract class MovieLocalDatasource {
  Future<String> getCachedMovieList();
  Future<String> getDetailCachedMovie(int movieId);
}

class MovieLocalDataSourceImpl extends MovieLocalDatasource {
  //init database

  @override
  Future<String> getCachedMovieList() {
    // TODO: implement getCachedMovieList
    throw UnimplementedError();
  }

  @override
  Future<String> getDetailCachedMovie(int movieId) {
    // TODO: implement getDetailCachedMovie
    throw UnimplementedError();
  }
}
