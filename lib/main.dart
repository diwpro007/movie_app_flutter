import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:movie_app_flutter/data/core/api_client.dart';
import 'package:movie_app_flutter/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app_flutter/data/repositories/move_repository_impl.dart';
import 'package:movie_app_flutter/domain/entities/no_params.dart';
import 'package:movie_app_flutter/domain/repositories/movie_repository.dart';
import 'package:movie_app_flutter/domain/usecases/get_trending.dart';

import 'domain/entities/app_error.dart';
import 'domain/entities/movie_entity.dart';

void main() async {
  ApiClient apiClient = ApiClient(Client());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(apiClient);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);
  Either<AppError, List<MovieEntity>> eitherResponse =
      await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print('error');
      print(l);
    },
    (r) {
      print('error');
      print(r);
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Container(),
    );
  }
}
