import 'package:test_moviedb/core/app_config.dart';
import 'package:test_moviedb/data/models/response_server.dart';
import 'package:test_moviedb/utils/api_helper.dart';

import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDatasource {
  Future<ResponseServer> getMovies(int page);

  Future<MovieModel> getSearchMovies(String query);

  Future<MovieDetailModel> getDetailMovies(int movieId);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDatasource {
  final ApiHelper apiHelper;

  MovieRemoteDataSourceImpl(this.apiHelper);

  @override
  Future<MovieDetailModel> getDetailMovies(int movieId) async {
    var result = await apiHelper.request(
        "GET", ConstantsApp.getMovieId + movieId.toString(),
        contentType: ConstantsApp.contentType);
    return result;
  }

  @override
  Future<ResponseServer> getMovies(int page) async {
    var query = {'page': page};
    var result = await apiHelper.request("GET", ConstantsApp.getMovies,
        contentType: ConstantsApp.contentType, queryParams: query);
    return result;
  }

  @override
  Future<MovieModel> getSearchMovies(String query) async {
    var searchQuery = {'query': query};
    var result = await apiHelper.request("GET", ConstantsApp.searchMovie,
        contentType: ConstantsApp.contentType, queryParams: searchQuery);
    return result;
  }
}
