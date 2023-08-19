import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit.dart';

class MovieDetailsView extends StatelessWidget {
  final int id;
  const MovieDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    MovieDetailsCubit cubit = BlocProvider.of(context);
    cubit.getData(id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie Details ${id}"),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
        if(state is GetMovieDetailsFailedState)
        {
          return const Center(child: Text("Failed"),);
        } else if (state is GetMovieDetailsSuccessState)
        {
          var model = state.model;
          return ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                padding: const EdgeInsets.all(25.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor.withOpacity(0.15),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    Image.network(
                      model.backdropPath,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Column(
                      children: [
                        Text(model.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                        const SizedBox(height: 16,),
                        Text(model.overview, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Theme.of(context).hintColor),),
                        const SizedBox(height: 16,),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.star, color: Colors.green,),
                            const SizedBox(width: 5,),
                            Text(model.voteAverage.toString(), style: const TextStyle(fontWeight: FontWeight.w700, color: Colors.green,),)
                          ],
                        ),
                        const SizedBox(height: 16,),
                        Text(model.originalLanguage, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.budget.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.imdbId, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.status, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.homepage, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.originalTitle, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.releaseDate, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.tagline, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.voteAverage.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.adult.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.popularity.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Text(model.voteCount.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                        const SizedBox(height: 16,),
                        Image.network(
                          model.posterPath,
                          height: 350,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        } else
        {
          return const Center(child: CircularProgressIndicator(),);
        }
      },),
    );
  }
}
