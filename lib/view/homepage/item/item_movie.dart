import 'package:flutter/material.dart';
import 'package:objectbox/objectbox.dart';
import 'package:test_moviedb/core/app_config.dart';
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
                      ConstantsApp.imageUrl+widget.movie.poster,
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
                    padding: EdgeInsets.only(left: 10, top: 5, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.movie.title, maxLines: 1, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                            Text(widget.movie.description, maxLines: 3, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w200),),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 13, color: Colors.black),
                            SizedBox(width: 8,),
                            Text(widget.movie.releaseDate),
                          ],
                        )
                      ],
                    )),
                Container(
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.14,
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.star, size: 13, color: Colors.orangeAccent),
                      Text(widget.movie.voteAverage.toStringAsFixed(1)),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
