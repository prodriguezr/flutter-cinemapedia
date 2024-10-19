import 'package:cinemapedia/domain/entities/entities.dart' show Movie;

abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page = 1});
}
