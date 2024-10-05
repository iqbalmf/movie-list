import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_list/domain/usecase/get_detail_movie_usecase.dart';
import 'package:movie_list/view/detailpage/bloc/detail_state.dart';

class DetailBloc extends Cubit<DetailState> {
  final GetDetailMovieUseCase getDetailMovieUseCase;

  DetailBloc(this.getDetailMovieUseCase) : super(DetailState());

  getDetailMovies(int idMovie) async {
    emit(state.copyWith(detailStatusState: DetailStatusState.loading));
    try {
      var result = await getDetailMovieUseCase.execute(movieId: idMovie);
      result.fold(
          (l) => emit(state.copyWith(detailStatusState: DetailStatusState.fail)),
          (r) => emit(state.copyWith(detailStatusState: DetailStatusState.done, movie: r))
      );
    } on Exception catch (e) {
      emit(state.copyWith(
          detailStatusState: DetailStatusState.fail, message: e.toString()));
    }
  }
}
