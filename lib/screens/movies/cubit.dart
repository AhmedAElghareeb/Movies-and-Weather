import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/screens/movies/model.dart';

part 'states.dart';


class MoviesCubit extends Cubit<MoviesStates>
{
  MoviesCubit():super(MoviesStates());

  final List<MovieModel> _list = [];

  int pageNumber = 1;

  void getMovies({bool fromPagination = false}) async {
    if(fromPagination)
    {
      emit(GetMoviesFromPaginationLoadingState());
    } else {
      emit(GetMoviesLoadingState());
    }
    try{
      var response = await Dio().get("https://api.themoviedb.org/3/discover/movie?api_key=2001486a0f63e9e4ef9c4da157ef37cd&page=$pageNumber");
      var model = FilmModel.fromJson(response.data);
      if(model.list.isNotEmpty)
      {
        pageNumber++;
        _list.addAll(model.list);
      }

      emit(GetMoviesSuccessState(list: _list));
    } on DioException catch(ex)
    {
      if(fromPagination)
      {
        emit(GetMoviesFromPaginationFailState(msg: ex.response!.data["errors"][0]));
      } else {
        emit(GetMoviesFailedState(msg: ex.toString()));
      }
    }
  }
}