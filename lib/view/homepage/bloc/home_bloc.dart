import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list/domain/usecase/get_movie_list_usecase.dart';
import 'package:movie_list/view/homepage/bloc/home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetMovieListUseCase getMovieListUseCase;

  HomeBloc(this.getMovieListUseCase) : super(HomeState());

  getListMovies(int page) async {
    emit(state.copyWith(
        movieStatusState: MovieStatusState.loading, currentPage: page));
    try {
      var result = await getMovieListUseCase.execute(page);
      result.fold(
        (l) async =>
            emit(state.copyWith(movieStatusState: MovieStatusState.fail)),
        (r) async => emit(
          state.copyWith(movieStatusState: MovieStatusState.done, movies: [...state.movies, ...r],)
        ),
      );
    } on Exception catch (e) {
      emit(state.copyWith(
          movieStatusState: MovieStatusState.fail, message: e.toString()));
    }
  }
}
