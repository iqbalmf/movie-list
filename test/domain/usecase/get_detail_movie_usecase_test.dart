import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_list/domain/entities/movie_detail_entity.dart';
import 'package:movie_list/domain/usecase/get_detail_movie_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main(){
  late MockMovieRepository movieRepository;
  late GetDetailMovieUseCase getDetailMovieUseCase;

  setUp((){
    movieRepository = MockMovieRepository();
    getDetailMovieUseCase = GetDetailMovieUseCase(movieRepository);
  });
  final tDetailMovieEntity = MovieDetailEntity(
      id: 1,
      homepage: "homepage",
      title: "title",
      description: "description",
      popularity: 1,
      poster: "poster",
      imdbId: "imdbId",
      genres: [],
      voteCount: 1,
      voteAverage: 1,
      status: "status",
      releaseDate: "releaseDate",
      budget: 1,
      revenue: 1);

  test("shuold get detail movie from repository", () async {
    when(movieRepository.getDetailMovie(any)).thenAnswer((_) async => Right(tDetailMovieEntity));
    final result = await getDetailMovieUseCase.execute(movieId: 1);
    expect(result, Right(tDetailMovieEntity));
    // expect(result, isNotNull, reason: "check not null response from repository");
    verify(movieRepository.getDetailMovie(any)).called(1);
    verifyNoMoreInteractions(movieRepository);
  });
}