import 'package:flutter/material.dart';
import 'package:mvvm/models/movies_list_model.dart';
import 'package:mvvm/res/appcolors.dart';

class MoviesDetailInfoscreen extends StatefulWidget {
  final Data movie;

  MoviesDetailInfoscreen({super.key, required this.movie});

  @override
  State<MoviesDetailInfoscreen> createState() => _MoviesDetailInfoscreenState();
}

class _MoviesDetailInfoscreenState extends State<MoviesDetailInfoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Appcolors.appbarcolor,
        title: Text(
          widget.movie.originalTitle.toString(),
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(" Overview ", style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),

            Text(
              widget.movie.overview.toString(),
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}

class Reusedablecard extends StatelessWidget {
  const Reusedablecard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
