import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';
import 'package:movie_list/domain/usecase/get_movie_list_usecase.dart';

import '../../helper/test_helper.mocks.dart';

void main(){
  late MockMovieRepository movieRepository;
  late GetMovieListUseCase getMovieListUseCase;

  setUp((){
    movieRepository = MockMovieRepository();
    getMovieListUseCase = GetMovieListUseCase(movieRepository);
  });
  final tMovieEntity = MovieEntity(
      id: 533535,
      title: "Deadpool & Wolverine",
      description: "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      poster: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      voteAverage: 7.752,
      voteCount: 3831);
  List<MovieEntity> tMovies = [];
  tMovies.add(tMovieEntity);
  
  test("shuold get list movie from repository", () async {
    when(movieRepository.getListMovie(page: anyNamed('page'), query: anyNamed('query'))).thenAnswer((realInvocation) async => Right(tMovies));
    final result = await getMovieListUseCase.execute(1);
    expect(result, Right(tMovies));
    verify(movieRepository.getListMovie(page: 1, query: null));
    verifyNoMoreInteractions(movieRepository);
  });
}