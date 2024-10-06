import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_list/data/models/movie_model.dart';
import 'package:movie_list/data/models/response_server.dart';
import 'package:movie_list/data/repositories/movie_repository_impl.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MovieRepositoryImpl movieRepositoryImpl;
  late MockMovieRemoteDatasource mockMovieRemoteDatasource;
  late MockMovieLocalDatasource mockMovieLocalDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockMovieRemoteDatasource = MockMovieRemoteDatasource();
    mockMovieLocalDatasource = MockMovieLocalDatasource();
    mockNetworkInfo = MockNetworkInfo();

    movieRepositoryImpl = MovieRepositoryImpl(
      movieRemoteDatasource: mockMovieRemoteDatasource,
      movieLocalDataSource: mockMovieLocalDatasource,
      networkInfo: mockNetworkInfo,
    );
  });

  List<MovieModel> tMovieModels = [];
  List<MovieEntity> tMovieEntities = [];
  final tMovieModel = MovieModel(
      id: 533535,
      title: "Deadpool & Wolverine",
      description:
          "A listless Wade Wilson toils away in civilian life with his days as the morally flexible mercenary, Deadpool, behind him. But when his homeworld faces an existential threat, Wade must reluctantly suit-up again with an even more reluctant Wolverine.",
      poster: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      voteAverage: 7.752,
      voteCount: 3831);
  tMovieModels.add(tMovieModel);

  final tMovieEntity = MovieEntity(
      id: 533535,
      title: "Deadpool & Wolverine",
      description:
          "overview",
      poster: "/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
      releaseDate: "2024-07-24",
      voteAverage: 7.752,
      voteCount: 3831);
  tMovieEntities.add(tMovieEntity);

  test("should return movie list when call api successfully", () async {
    when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
    when(mockMovieRemoteDatasource.getMovies(any)).thenAnswer((_) async {
      return ResponseServer(
        data: {
          'results': [
            {'id': 533535, 'title': 'Deadpool & Wolverine', 'overview': 'overview', 'poster_path': '/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg', 'release_date': '2024-07-24', 'vote_average': 7.752, 'vote_count': 3831},
          ],
        },
      );
    });
    final result = await movieRepositoryImpl.getListMovie(query: null, page: 1);
    result.fold((l) => "", (l) => expect(l, tMovieEntities));
    verify(mockMovieRemoteDatasource.getMovies(any));
    verifyNoMoreInteractions(mockMovieRemoteDatasource);
  });

  test("should return internet connected", () async {
    when(mockNetworkInfo.isConnected()).thenAnswer((_) async => true);
    final result = await mockNetworkInfo.isConnected();
    expect(result, true);
    verify(mockNetworkInfo.isConnected());
    verifyNoMoreInteractions(mockNetworkInfo);
  });


  test("should return internet not connected", () async {
    when(mockNetworkInfo.isConnected()).thenAnswer((_) async => false);
    final result = await mockNetworkInfo.isConnected();
    expect(result, false);
    verify(mockNetworkInfo.isConnected());
    verifyNoMoreInteractions(mockNetworkInfo);
  });
}
