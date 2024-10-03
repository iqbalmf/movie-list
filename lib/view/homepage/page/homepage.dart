import 'package:flutter/material.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';
import 'package:test_moviedb/view/homepage/item/item_movie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<MovieEntity> movies = [
    MovieEntity(
        id: 1,
        title: 'The Infernal Machine',
        description: 'description 1',
        poster: 'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 2,
        title: 'The Aviary',
        description: 'description 2',
        poster: 'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 3,
        title: 'The jack in the box: awakening',
        description: 'description 3',
        poster: 'https://image.tmdb.org/t/p/w200/dvBCdCohwWbsP5qAaglOXagDMtk.jpg',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 4,
        title: 'the ledge',
        description: 'description 4',
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 5,
        title: 'the batman',
        description: 'description 5',
        poster: '',
        releaseDate: "3 okt 2024",
        voteAverage: 8.77,
        voteCount: 1234),
    MovieEntity(
        id: 6,
        title: 'the spiderman',
        description: 'description 6',
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Movie'),
      ),
      body: Container(
        color: Colors.white70,
        child: movie(),
      ),
    );
  }

  List<MovieEntity> filteredMovies = [];
  String searchQuery = "";

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
      filteredMovies = movies
          .where((movie) =>
              movie.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    filteredMovies = movies;
  }

  Widget movie() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            onChanged: (q) => updateSearchQuery(q),
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
