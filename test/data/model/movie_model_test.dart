import 'dart:convert';
import 'dart:math';

import 'package:movie_list/data/mapper/MovieMapper.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';

import '../../helper/json_reader.dart';

void main() {
  List<MovieModel> tMovieModels = [];
  final tMovieModel = MovieModel(
      id: 533535,
      title: "Deadpool & Wolverine",
      description: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      poster: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      voteAverage: 7.752,
      voteCount: 3831);
  tMovieModels.add(tMovieModel);

  final tMovieEntity = MovieEntity(
      id: 533535,
      title: "Deadpool & Wolverine",
      description: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      poster: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      voteAverage: 7.752,
      voteCount: 3831);
  test("Mapper should be class in Movie Entity", () async {
    final result = MovieMapper.movieModelToEntity(tMovieModel);
    expect(result, equals(tMovieEntity));
  });

  test("MovieModel should convert from json response", (){
    final Map<String, dynamic> jsonMap = json.decode(jsonReader('movies.json'));
    MovieModel result = List<MovieModel>.from(jsonMap['results'].map((json) => MovieModel.fromJson(json))).first;
    expect(result.id, tMovieModel.id);
  });
}
