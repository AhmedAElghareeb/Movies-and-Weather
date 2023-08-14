import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/screens/movies/cubit.dart';
import 'package:movies_test/screens/movies/model.dart';

part 'item.dart';
class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Movies"),
      ),
      body: BlocBuilder<MoviesCubit, MoviesStates>(
        buildWhen: (previous, current) => current is! GetMoviesFromPaginationLoadingState && current is! GetMoviesFromPaginationFailState,
        builder: (context, state) {
          if(state is GetMoviesLoadingState)
          {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetMoviesFailedState)
          {
            return Center(child: Text(state.msg),);
          } else if (state is GetMoviesSuccessState)
          {
            return NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
                {
                  BlocProvider.of<MoviesCubit>(context).getMovies(fromPagination: true);
                }
                return true;
              },
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(18),
                itemBuilder: (context, index) => _Item(model: state.list[index]),
                separatorBuilder: (context, index) => const Divider(color: Colors.black,),
                itemCount: state.list.length,
              ),
            );
          } else
          {
            return Text("Un Handled State..");
          }
        },
    ),
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 50.0,
          child: BlocBuilder<MoviesCubit, MoviesStates>(
            buildWhen: (previous, current) => current is GetMoviesFromPaginationLoadingState || current is GetMoviesSuccessState || current is GetMoviesFromPaginationFailState,
            builder: (context, state) {
            if(state is GetMoviesFromPaginationLoadingState)
            {
              return Center(
                child: CircularProgressIndicator(),);
            } else if(state is GetMoviesFromPaginationFailState)
            {
              return Center(
                child: Text(state.msg),
              );
            } else {
              return SizedBox.shrink();
            }
          },
          ),
        ),
      ),
    );
  }
}


