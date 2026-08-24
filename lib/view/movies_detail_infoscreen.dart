import 'package:flutter/material.dart';
import 'package:mvvm/models/movies_list_model.dart';

class MoviesDetailInfoscreen extends StatefulWidget {
  // Fixed: Declared the movie field and assigned it in constructor
  final Data movie;
  const MoviesDetailInfoscreen({super.key, required this.movie});

  @override
  State<MoviesDetailInfoscreen> createState() => _MoviesDetailInfoscreenState();
}

class _MoviesDetailInfoscreenState extends State<MoviesDetailInfoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Fixed: Access the movie title from widget.movie
        title: Text(widget.movie.originalTitle.toString()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.movie.posterPath.toString()),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie.originalTitle.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("Release Date: ${widget.movie.releaseDate}"),
                  const SizedBox(height: 10),
                  Text(
                    widget.movie.overview.toString(),
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
