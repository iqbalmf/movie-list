import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

class ItemMovie extends StatefulWidget {
  final MovieEntity movie;
  final Function() onTap;

  const ItemMovie({super.key, required this.movie, required this.onTap});

  @override
  State<ItemMovie> createState() => _ItemMovieState();
}

class _ItemMovieState extends State<ItemMovie> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 130,
        margin: EdgeInsets.symmetric(vertical: 6.0),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(10), // Menyelaraskan radius border card
            ),
            child: Row(
              children: [
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Image.network(
                      widget.movie.poster,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
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
                ),
                Container(
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(widget.movie.title),
                        Text(widget.movie.releaseDate)
                      ],
                    )),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.14,
                  padding: EdgeInsets.only(bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(widget.movie.voteAverage.toStringAsFixed(1))
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
