import 'package:equatable/equatable.dart';
import 'package:test_moviedb/domain/entities/movie_detail_entity.dart';

enum DetailStatusState { init, loading, done, fail }

class DetailState extends Equatable {
  String? message;
  DetailStatusState? detailStatusState;
  MovieDetailEntity? movie;

  DetailState({this.message, this.detailStatusState, this.movie});

  DetailState copyWith(
          {String? message,
          DetailStatusState? detailStatusState,
          MovieDetailEntity? movie}) =>
      DetailState(
          message: message,
          detailStatusState: detailStatusState,
          movie: movie ?? this.movie);

  @override
  List<Object?> get props => [message, detailStatusState, movie];
}
