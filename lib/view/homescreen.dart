import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_names.dart';
import 'package:mvvm/view_model/movie_home_model.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  MovieHomeModel homeviewmodel = MovieHomeModel();

  @override
  void initState() {
    super.initState();
    homeviewmodel.getmoviedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies"),
        actions: const [
          Center(child: Text("logout")),
          SizedBox(width: 20),
        ],
      ),
      body: ChangeNotifierProvider<MovieHomeModel>(
        create: (BuildContext context) => homeviewmodel,
        child: Consumer<MovieHomeModel>(
          builder: (context, value, child) {
            switch (value.moviesList.status) {
              case Status.LOADING:
                return const Center(
                  child: CircularProgressIndicator(color: Colors.black26),
                );
              case Status.ERROR:
                return Center(child: Text(value.moviesList.message.toString()));
              case Status.COMPLETED:
                return ListView.builder(
                  // Fixed: Use the length of the actual movie data list
                  itemCount: value.moviesList.data!.data!.length,
                  itemBuilder: (context, index) {
                    final movie = value.moviesList.data!.data![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RoutesNames.moviedetail,
                            arguments: movie,
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          elevation: 2,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                movie.posterPath.toString(),
                              ),
                            ),
                            title: Text(movie.originalTitle.toString()),
                            subtitle: Text("Rating: ${movie.voteAverage}"),
                            trailing: Text("Votes: ${movie.voteCount}"),
                          ),
                        ),
                      ),
                    );
                  },
                );
              default:
                return const Center(child: Text("Unexpected Status"));
            }
          },
        ),
      ),
    );
  }
}
