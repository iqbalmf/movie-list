import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/view/detailpage/page/detailpage.dart';
import 'package:test_moviedb/view/homepage/bloc/home_bloc.dart';
import 'package:test_moviedb/view/homepage/bloc/home_state.dart';
import 'package:test_moviedb/view/homepage/item/item_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieEntity> exMovie = [
    MovieEntity(
        id: 1,
        title: 'The Infernal Machine',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster:
            'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 2,
        title: 'The Aviary',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster:
            'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 3,
        title: 'The jack in the box: awakening',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster:
            'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 4,
        title: 'the ledge',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 5,
        title: 'the batman',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 6,
        title: 'the spiderman',
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 7,
        title: 'the dracula',
        description: 'description 7',
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 8,
        title: 'cat and dog',
        description: 'description 8',
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
  ];

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
            child: state.movieStatusState == MovieStatusState.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : movie(state),
          ),
        );
      },
    );
  }

  List<MovieEntity> filteredMovies = [];
  String searchQuery = "";

  void updateSearchQuery(String query, {List<MovieEntity>? movies}) {
    setState(() {
      searchQuery = query;
      filteredMovies = movies
          ?.where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList() ?? [];
    });
  }

  @override
  void initState() {
    super.initState();
    // filteredMovies = movies;
    context.read<HomeBloc>().getListMovies(1);
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
              suffixIcon: searchQuery.isNotEmpty
                  ? IconButton(
                      onPressed: () {
                        updateSearchQuery('');
                      },
                      icon: Icon(Icons.clear))
                  : null,
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
                    // Move to Detail Movie
                    WidgetsBinding.instance.addPostFrameCallback((_) =>
                        WidgetsBinding.instance.focusManager.primaryFocus
                            ?.unfocus());
                    Get.to(
                      () => DetailMoviePage(movieEntity: filteredMovies[index]),
                    );
                  },
                );
              },
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
