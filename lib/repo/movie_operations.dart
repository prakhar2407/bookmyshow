import '../models/movie.dart';

// Singleton
class MovieOperation {
  // Lazilly Loading
  static MovieOperation _movieOperation = MovieOperation();
  // we r making private constructor to stop making object
  _MovieOperation() {}

  static MovieOperation getInstance() {
    return _movieOperation;
  }

  // We can make static this but it will eagerly load in to the memory
  List<Movie> getmovies() {
    return [
      Movie(
          title: "Hindi Medium",
          language: "Hindi",
          id: "https://prakashgowda.files.wordpress.com/2017/05/hindi-medium-movie-poster.jpg",
          noOfVotes: "923",
          votesPercent: "87"),
      Movie(
          title: "Half GirlFriend",
          language: "Hindi",
          id: "https://www.un.org/sites/un2.un.org/files/styles/large-article-image-style-16-9/public/field/image/1da42153570573.5938fd77e87cd.jpg?itok=wXjRkp_f",
          noOfVotes: "1023",
          votesPercent: "92"),
      Movie(
          title: "Rab ne bna di jodi",
          language: "Hindi",
          id: "https://www.yashrajfilms.com/images/default-source/Movies/Rab-Ne-Bana-Di-Jodi/rab-ne-bana-di-jodi_mobile.jpg?sfvrsn=8",
          noOfVotes: "332",
          votesPercent: "88"),
      Movie(
          title: "Ready",
          language: "Hindi",
          id: "https://i.ytimg.com/vi/tPXYWRGNl7s/maxresdefault.jpg",
          noOfVotes: "2000",
          votesPercent: "92"),
    ];
  }
}
