import 'package:flutter/material.dart';
import 'package:test_moviedb/domain/entities/movie_entity.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.movieEntity.title),
      ),
      body: Container(
        color: Colors.white70,
        child: detailMovie(),
      ),
    );
  }

  Widget detailMovie() {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  height: double.infinity,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Image.network(
                    ConstantsApp.imageUrl+widget.movieEntity.poster,
                    fit: BoxFit.fitWidth,
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
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rating",
                        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                      ),
                      Text(
                        widget.movieEntity.voteAverage.toStringAsFixed(1),
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(height: 6,),
                      Text(
                        "Director",
                        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                      ),
                      Text(
                        '-',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Staring",
                        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                      ),
                      Text(
                        '-',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        "Genre",
                        style: TextStyle(fontWeight: FontWeight.w100, fontSize: 12),
                      ),
                      Text(
                        '-',
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.movieEntity.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                widget.movieEntity.description,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14.0),
              ),
              SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  //open webview page
                },
                child: Text('Open Website'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
