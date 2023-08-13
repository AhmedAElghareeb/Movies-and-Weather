part of 'cubit.dart';

class MoviesStates{}

class GetMoviesLoadingState extends MoviesStates{}

class GetMoviesSuccessState extends MoviesStates{
  final List<MovieModel> list;

  GetMoviesSuccessState({required this.list});
}
class GetMoviesFailedState extends MoviesStates{
  final String msg;

  GetMoviesFailedState({required this.msg});
}


class GetMoviesFromPaginationLoadingState extends MoviesStates{}
class GetMoviesFromPaginationFailState extends MoviesStates{
  final String msg;

  GetMoviesFromPaginationFailState({required this.msg});
}
