import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_list/data/datasource/movie_local_datasource.dart';
import 'package:movie_list/data/datasource/movie_remote_datasource.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:movie_list/data/models/response_server.dart';

import '../../helper/json_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockApiHelper mockApiHelper;
  late MovieRemoteDataSourceImpl remoteDataSourceImpl;
  late MovieLocalDataSourceImpl localDataSourceImpl;
  setUp(() {
    mockApiHelper = MockApiHelper();
    remoteDataSourceImpl = MovieRemoteDataSourceImpl(mockApiHelper);
  });
  final httpResponse = Future.value(ResponseServer(
      data: jsonReader('movies.json'), statusCode: HttpStatus.ok));
  final Map<String, dynamic> jsonMap = json.decode(jsonReader('movies.json'));
  final tMoviesModel = List<MovieModel>.from(
      jsonMap['results'].map((json) => MovieModel.fromJson(json)));

  test("Should return List MovieModel when response code 200", () async {
    when(mockApiHelper.request(
      "GET",
      "/discover/movie",
      contentType: anyNamed('contentType'),
      queryParams: anyNamed('queryParams'),
      content: anyNamed('content'),
    )).thenAnswer((_) async => httpResponse);
    final response = await remoteDataSourceImpl.getMovies(1);
    expect(response.statusCode, equals(HttpStatus.ok));
    expect(json.decode(response.data), equals(jsonMap));
    expect(
        List<MovieModel>.from(json
            .decode(response.data)['results']
            .map((json) => MovieModel.fromJson(json))).first.id,
        tMoviesModel.first.id);
  });

  test("Should throw Server Failure when response code 404", () async {
    when(mockApiHelper.request(
      "GET",
      "/discover/movie",
      contentType: anyNamed('contentType'),
      queryParams: anyNamed('queryParams'),
      content: anyNamed('content'),
    )).thenAnswer((_) async =>
        Future.value(ResponseServer(statusCode: HttpStatus.notFound)));
    final response = await remoteDataSourceImpl.getMovies(1);
    expect(response.statusCode, equals(HttpStatus.notFound));
  });
}
