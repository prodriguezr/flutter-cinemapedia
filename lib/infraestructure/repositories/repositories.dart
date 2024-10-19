import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie_entity.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class TheMovieDbRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;

  TheMovieDbRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return datasource.getNowPlaying(page: page);
  }
}
