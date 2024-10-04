import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/utils/number_formatting.dart';
import 'package:test_moviedb/view/detailpage/bloc/detail_bloc.dart';
import 'package:test_moviedb/view/detailpage/bloc/detail_state.dart';
import 'package:test_moviedb/view/webviewpage/page/web_page.dart';

import '../../../core/app_config.dart';

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(widget.movieEntity.title),
          ),
          body: Container(
            color: Colors.white70,
            child: state.detailStatusState == DetailStatusState.loading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(child: detailMovie(state)),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<DetailBloc>().getDetailMovies(widget.movieEntity.id);
  }

  Widget detailMovie(DetailState state) {
    return Container(
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              bool isPortrait =
                  MediaQuery.of(context).orientation == Orientation.portrait;
              return Container(
                  height: isPortrait
                      ? MediaQuery.of(context).size.height * 0.35
                      : MediaQuery.of(context).size.height * 0.7,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        width: isPortrait
                            ? constraints.maxWidth * 0.5
                            : constraints.maxWidth * 0.3,
                        child: Image.network(
                          ConstantsApp.imageUrl + widget.movieEntity.poster,
                          fit: BoxFit.fitWidth,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          (loadingProgress.expectedTotalBytes ??
                                              1)
                                      : null,
                                ),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/icon-not-found.png',
                              fit: BoxFit.contain,
                            );
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 10.0),
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: constraints.maxHeight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              state.movie?.status ?? "-",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Text(
                              "Release Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              state.movie?.releaseDate ??
                                  widget.movieEntity.releaseDate,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Text(
                              "Rating",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              state.movie?.voteAverage.toStringAsFixed(1) ??
                                  widget.movieEntity.voteAverage
                                      .toStringAsFixed(1),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            const Text(
                              "Budget",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              NumberFormatting.formatCurrency(
                                      state.movie?.budget ?? 0) ??
                                  "-",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Text(
                              "Revenue",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              NumberFormatting.formatCurrency(
                                      state.movie?.revenue ?? 0) ??
                                  '-',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Text(
                              "Genre",
                              style: TextStyle(
                                  fontWeight: FontWeight.w100, fontSize: 12),
                            ),
                            Text(
                              state.movie?.genres
                                      .map((g) => g.name)
                                      .join(', ') ??
                                  '-',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ],
                        ),
                      )
                    ],
                  ));
            },
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movieEntity.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.movieEntity.description,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontSize: 14.0),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if(state.movie != null){
                        Get.to(
                            () => WebPage(
                              urlMovie: ConstantsApp.imdbUrl+state.movie!.imdbId,
                            ),
                          );
                        }
                      },
                      child: Text('Open IMDB'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if(state.movie != null){
                          Get.to(
                                () => WebPage(
                              urlMovie: state.movie!.homepage,
                            ),
                          );
                        }
                      },
                      child: Text('Open Website'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
