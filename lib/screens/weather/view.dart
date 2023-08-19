import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_test/screens/weather/cubit.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});


  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = BlocProvider.of(context);
    cubit.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text("Weather App"),
      ),
      body: BlocBuilder(
        bloc: cubit,
        //buildWhen: (previous, current) => current is! GetWeatherFromPaginationLoadingState && current is! GetWeatherFromPaginationFailState,
        builder: (context, state) {
          if (state is GetWeatherLoadingState)
          {
            return const Center(child: CircularProgressIndicator());
          } else if (state is GetWeatherFailedState)
          {
            return Center(child: Text(state.msg),);
          } else if (state is GetWeatherSuccessState)
          {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  TextFormField(
                    controller: BlocProvider.of<WeatherCubit>(context).cityController,
                  ),
                  const SizedBox(height: 18,),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<WeatherCubit>(context).getData();
                    },
                    child: const Text("Find"),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(BlocProvider.of<WeatherCubit>(
                          context).model!.main.temp.toString()),
                      Text(BlocProvider.of<WeatherCubit>(
                          context).model!.name),
                    ],
                  ),
                ],
              ),
            );
            // return NotificationListener<ScrollNotification>(
            //   onNotification: (notification) {
            //     if(notification.metrics.pixels == notification.metrics.maxScrollExtent && notification is ScrollUpdateNotification)
            //     {
            //       BlocProvider.of<WeatherCubit>(context).getData(fromPagination: true);
            //     }
            //     return true;
            //     },
            //   child: SingleChildScrollView(
            //     padding: EdgeInsets.all(25),
            //     child: Column(
            //       children: [
            //         TextFormField(
            //           controller: BlocProvider.of<WeatherCubit>(context).cityController,
            //         ),
            //         SizedBox(height: 18,),
            //         ElevatedButton(
            //           onPressed: () {
            //             BlocProvider.of<WeatherCubit>(context).getData();
            //             },
            //           child: Text("Find"),
            //         ),
            //         Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //             Text(BlocProvider.of<WeatherCubit>(
            //                 context).model!.main.temp.toString()),
            //             Text(BlocProvider.of<WeatherCubit>(
            //                 context).model!.name),
            //           ],
            //         ),
            //       ],
            //     ),
            //   ),
            // );
          } else
            {
              return const Text("Un Handled State..");
            }
        },
      ),
    );
  }
}
