import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/datasources.dart';
import 'package:cinemapedia/domain/entities/movie_entity.dart';
import 'package:cinemapedia/infraestructure/dto/themoviedb/moviedb_response_dto.dart';
import 'package:cinemapedia/infraestructure/mappers/themoviedb/movie_mapper.dart';
import 'package:dio/dio.dart';

class TheMovieDbDatasource extends MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    queryParameters: {
      'api_key': Environment.movieDbApiKey,
      'language': 'es-CL',
    },
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('movie/now_playing');

    final movieDbResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDbResponse.results
        .where((e) => e.posterPath != 'no-poster')
        .map((e) => TheMovieDbMovieMapper.movieDbToEntity(e))
        .toList();

    return movies;
  }
}
