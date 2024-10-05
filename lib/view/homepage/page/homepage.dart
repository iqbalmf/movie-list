import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:movie_list/domain/entities/movie_entity.dart';
import 'package:movie_list/utils/network_status.dart';
import 'package:movie_list/view/detailpage/page/detailpage.dart';
import 'package:movie_list/view/homepage/bloc/home_bloc.dart';
import 'package:movie_list/view/homepage/bloc/home_state.dart';
import 'package:movie_list/view/homepage/item/item_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  late HomeBloc _homeBloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state.movieStatusState == MovieStatusState.done) {
          filteredMovies = state.movies;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('My Movie'),
          ),
          body: Container(
            color: Colors.white70,
            child: movie(state),
          ),
        );
      },
    );
  }

  List<MovieEntity> filteredMovies = [];
  String searchQuery = "";

  Future<void> updateSearchQuery(String query, {List<MovieEntity>? movies}) async {
    if (await NetworkStatus.isNetworkOnline()){
      //get data from searching
    } else {
      setState(() {
        searchQuery = query;
        filteredMovies = movies
            ?.where((movie) =>
            movie.title.toLowerCase().contains(query.toLowerCase()))
            .toList() ?? [];
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.getListMovies(1);
  }

  Future<void> _onScroll() async {
    if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
      printInfo(info: "Max Scroll!!");
      if(await NetworkStatus.isNetworkOnline()) {
        _homeBloc.getListMovies(_homeBloc.state.currentPage + 1);
      }
    }
  }

  Widget movie(HomeState homeState) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (q) => updateSearchQuery(q, movies: homeState.movies),
            decoration: InputDecoration(
              hintText: "Search",
              prefix: Icon(Icons.search),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ItemMovie(
                  movie: filteredMovies[index],
                  onTap: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus());
                    Get.to(
                      () => DetailMoviePage(movieEntity: filteredMovies[index]),
                    );
                  },
                );
              },
              controller: _scrollController,
              itemCount: filteredMovies.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
            ),
          )
        ],
      ),
    );
  }
}
