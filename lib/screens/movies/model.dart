class FilmModel {
  late final int page,totalPages,totalResults;
  late final List<MovieModel> list;

  FilmModel.fromJson(Map<String, dynamic> json){
    page = json['page'];
    list = List.from(json['results']).map((e)=>MovieModel.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieModel {
  late final bool adult;
  late final String image;
  late final List<int> genreIds;
  late final int id;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final double popularity;
  late final String posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double? voteAverage;
  late final int voteCount;

  MovieModel.fromJson(Map<String, dynamic> json){
    adult = json['adult'];
    image = "http://image.tmdb.org/t/p/original${json['backdrop_path']}";
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = double.parse(json['popularity'].toString());
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = double.parse(json['vote_average'].toString());
    voteCount = json['vote_count'];
  }
}