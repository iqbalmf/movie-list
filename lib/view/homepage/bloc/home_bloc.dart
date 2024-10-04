import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_moviedb/view/homepage/bloc/home_state.dart';
import 'package:test_moviedb/domain/usecase/get_movie_list_usecase.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetMovieListUseCase getMovieListUseCase;

  HomeBloc(this.getMovieListUseCase) : super(HomeState());

  getListMovies(int page) async {
    emit(state.copyWith(movieStatusState: MovieStatusState.loading));
    try {
      var result = await getMovieListUseCase.execute(page);
      result.fold(
          (l) async =>
              emit(state.copyWith(movieStatusState: MovieStatusState.fail)),
          (r) => emit(state.copyWith(
              movieStatusState: MovieStatusState.done, movies: r)));
    } on Exception catch (e) {
      emit(state.copyWith(
          movieStatusState: MovieStatusState.fail, message: e.toString()));
    }
  }
}
