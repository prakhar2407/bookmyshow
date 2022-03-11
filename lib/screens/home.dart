import '../models/movie.dart';
import '../repo/movie_operations.dart';
import 'package:flutter/material.dart';

class BookMyShow extends StatelessWidget {
  List<Movie> movies = [];
  BookMyShow({Key? key}) : super(key: key) {
    MovieOperation movieOperation = MovieOperation.getInstance();
    movies = movieOperation.getmovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            children: _getMovieList()
            // [_getContainer(), _getContainer(), _getContainer()]
            ,
          ),
        ),
      ),
      // body: ,
    );
  }

  List<Widget> _getMovieList() {
    return movies.map((movie) {
      return _getContainer(movie);
    }).toList();
  }

  _getUpperPortion() {
    return Container(
      height: 80,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: const [
                  Icon(
                    Icons.language_sharp,
                    color: Colors.blue,
                  ),
                  Text("All Languages")
                ],
              ),
              Column(
                children: const [
                  Text(
                    "|",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Column(
                children: const [
                  Icon(
                    Icons.chair,
                    color: Colors.red,
                  ),
                  Text("Cinemas")
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      bottom: PreferredSize(
        child: _getUpperPortion(),
        preferredSize: const Size.fromHeight(85),
      ),
      backgroundColor: Colors.grey[800],
      title: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // color: Colors.red,
                height: 40,
                width: 100,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  // border: Border.all(color: Colors.black)
                ),
                child: Center(
                  child: Text(
                    "Now Showing",
                    style: TextStyle(
                        color: Colors.white, backgroundColor: Colors.red),
                  ),
                ),
              ),
              //  Text("19CSU071")
              Container(
                // color: Colors.red,
                height: 40,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[600],
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  // border: Border.all(color: Colors.black)
                ),
                child: Center(
                  child: Text(
                    "Coming Soon",
                    style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.grey[600],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      titleTextStyle: TextStyle(backgroundColor: Colors.grey[350]),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.search),
        )
      ],
    );
  }
}

Widget _getContainer(Movie movie) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Card(
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                movie.id,
                fit: BoxFit.cover,
              ),
              const Text(
                "New",
                style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.green),
              ),
              const Positioned(
                bottom: 10,
                left: 8,
                child: Icon(
                  Icons.circle_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  height: 80,
                  width: 150,
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12.withOpacity(0.5),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.movie_creation_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                          ),
                          Text(
                            movie.votesPercent + "%",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            movie.noOfVotes,
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                          const Text(
                            " votes",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          // SizedBox(
          //   height: 9,
          // ),
          Container(
            height: 90,
            child: Stack(
              children: [
                Positioned(
                    left: 10,
                    top: 15,
                    child: Text(
                      movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                Positioned(left: 10, bottom: 10, child: Text(movie.language)),
                Positioned(
                    bottom: 10,
                    left: 60,
                    child: Container(
                        width: 28,
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(2)),
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: const Text(
                          " 2D",
                        ))),
                Positioned(
                  right: 20,
                  bottom: 10,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red)),
                      onPressed: () {},
                      child: const Text("Book")),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
